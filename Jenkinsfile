pipeline {
    agent any

    environment {
        LOCAL_PROJECT_PATH = "D:/Shariq/Devops/prac5/Q5"
        IMAGE_NAME = "my-node-app"
        CONTAINER_NAME = "node-container"
        BUILD_CONTEXT = "${env.WORKSPACE}/app"
    }

    stages {
        stage('Prepare Workspace') {
            steps {
                script {
                    // Create build context directory inside workspace
                    bat "mkdir %BUILD_CONTEXT%"

                    // Copy all files from local project folder to workspace/app
                    bat "xcopy /E /I /Y \"%LOCAL_PROJECT_PATH%\\*\" \"%BUILD_CONTEXT%\\\""
                }
            }
        }

        stage('Install Node Dependencies') {
            steps {
                script {
                    bat "cd %BUILD_CONTEXT% && npm install"
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Copy Dockerfile from Jenkins workspace (from GitHub repo) into build context
                    bat "copy Dockerfile %BUILD_CONTEXT%"

                    // Build docker image using app folder as context
                    bat "docker build -t %IMAGE_NAME% %BUILD_CONTEXT%"
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    bat "docker run --rm -p 3000:3000 --name %CONTAINER_NAME% %IMAGE_NAME%"
                }
            }
        }
    }
}

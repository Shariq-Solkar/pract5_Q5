pipeline {
    agent any

    environment {
        PROJECT_PATH = "D:\Shariq\Devops\prac5\Q5"
        IMAGE_NAME = "my-node-app"
        CONTAINER_NAME = "node-container"
    }

    stages {
        stage('Install Node Dependencies') {
            steps {
                script {
                    // Ensure node_modules is fresh each time (optional)
                    bat "cd %PROJECT_PATH% && npm install"
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    bat "docker build -t %IMAGE_NAME% %PROJECT_PATH%"
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

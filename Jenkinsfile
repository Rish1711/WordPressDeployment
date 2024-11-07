pipeline {
    agent any
    environment {
        MYSQL_ROOT_PASSWORD = credentials('MYSQL_ROOT_PASSWORD') // Jenkins credentials
    }
    stages {
        stage('Clone Repository') {
            steps {
                // Checkout the main branch explicitly
                git branch: 'main', url: 'https://github.com/Rish1711/WordPressDeployment.git'
            }
        }
        stage('Build and Deploy') {
            steps {
                script {
                    // Build WordPress Image
                    sh 'docker build -t wordpress_app .'
                    // Deploy using docker-compose.yml
                    sh 'docker stack deploy -c docker-compose.yml wordpress_stack'
                }
            }
        }
    }
}

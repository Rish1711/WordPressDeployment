pipeline {
    agent any
    environment {
        MYSQL_ROOT_PASSWORD = credentials('MYSQL_ROOT_PASSWORD')
        SSH_USER = 'docker-user'
        DOCKER_NODE_IP = '13.232.170.253'
    }
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/Rish1711/WordPressDeployment.git'
            }
        }
        stage('Build and Deploy') {
            steps {
                script {
                    // Build Docker image
                    sh 'docker build -t wordpress_app .'

                    // Save Docker image to a tar file
                    sh 'docker save wordpress_app -o wordpress_app.tar'

                    // Copy the tar file to the Docker node
                    sh "scp wordpress_app.tar ${SSH_USER}@${DOCKER_NODE_IP}:~/"

                    // Load the image on the Docker node and clean up
                    sh """
                    ssh ${SSH_USER}@${DOCKER_NODE_IP} '
                        docker load -i ~/wordpress_app.tar &&
                        rm ~/wordpress_app.tar
                    '
                    """

                    // Copy docker-compose.yml to the Docker node
                    sh "scp docker-compose.yml ${SSH_USER}@${DOCKER_NODE_IP}:~/"

                    // Deploy stack using docker-compose on the Docker node
                    sh """
                    ssh ${SSH_USER}@${DOCKER_NODE_IP} '
                        MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} docker stack deploy -c docker-compose.yml wordpress_stack
                    '
                    """
                }
            }
        }
    }
}

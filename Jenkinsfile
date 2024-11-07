pipeline {
    agent any
    environment {
        MYSQL_ROOT_PASSWORD = credentials('MYSQL_ROOT_PASSWORD') // Jenkins credential ID for MySQL password
        DOCKER_NODE = '13.232.170.253' // IP or hostname of your Docker Swarm manager node
        SSH_USER = 'docker-user' // Replace with SSH user with access to Docker node
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
                    // Build WordPress Image locally on Jenkins node
                    sh 'docker build -t wordpress_app .'
                    
                    // Copy docker-compose.yml and built image to the Docker node
                    sh """
                    docker save wordpress_app | ssh ${SSH_USER}@${DOCKER_NODE} 'docker load'
                    scp docker-compose.yml ${SSH_USER}@${DOCKER_NODE}:~/
                    """
                    
                    // Run Docker commands on the specified node
                    sh """
                    ssh ${SSH_USER}@${DOCKER_NODE} '
                        docker swarm init || true  # Initialize Docker Swarm; ignore if already initialized
                        MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} docker stack deploy -c docker-compose.yml wordpress_stack
                    '
                    """
                }
            }
        }
    }
}


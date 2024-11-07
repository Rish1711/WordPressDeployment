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
                    // Load the Docker image to the target node
            sh '''
            ssh docker-user@13.232.170.253 'docker load'
            docker save wordpress_app
            '''

            // Transfer the docker-compose.yml file
            sh '''
            scp docker-compose.yml docker-user@13.232.170.253:~/
            '''

            // Only initialize Swarm if not already part of a swarm
            sh '''
            ssh docker-user@13.232.170.253 '
                if ! docker info | grep -q "Swarm: active"; then
                    docker swarm init
                fi
                MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD docker stack deploy -c docker-compose.yml wordpress_stack
            '
            '''
                }
            }
        }
    }
}


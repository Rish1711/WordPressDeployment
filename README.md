# My PHP Application with MySQL

This is a simple PHP application that connects to a MySQL database using Docker containers.

## Requirements

- Docker
- Docker Compose

## Setup Instructions

1. Clone this repository:

    ```bash
    git clone https://github.com/your-repo/my-php-app.git
    cd my-php-app
    ```

2. Create a `.env` file by copying the example:

    ```bash
    cp .env.example .env
    ```

3. Start the application using Docker Compose:

    ```bash
    docker-compose up --build
    ```

4. The PHP app will be available at `http://localhost:8080`.

## CI/CD Pipeline

The Jenkins pipeline automates the build, test, and deployment process. Refer to the `Jenkinsfile` for pipeline configuration.

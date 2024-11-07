
## Prerequisites

- **Docker**: Ensure Docker is installed and running.
- **Jenkins**: A Jenkins server configured to run pipelines.
- **MySQL Container**: An existing MySQL container configured with:
  - **Database Name**: `wordpress`
  - **Username**: `root`
  - **Password**: Managed securely in Jenkins credentials.

## Environment Variables

The PHP application uses the following environment variables to connect to the MySQL database:

- `DB_HOST`: MySQL database host (e.g., `localhost`)
- `DB_DATABASE`: Name of the MySQL database (set to `wordpress`)
- `DB_USERNAME`: Username for MySQL (set to `root`)
- `DB_PASSWORD`: Password for MySQL (retrieved securely from Jenkins credentials)

## Setup Instructions

### 1. Clone the Repository

Clone this repository to your Jenkins server or development environment:

```bash
git clone https://github.com/your-repo/php-mysql-interface.git
cd php-mysql-interface

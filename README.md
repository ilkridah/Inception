# Project Overview

This project sets up a multi-container infrastructure using Docker and Docker Compose within a virtual machine. 
The aim is to create a reliable environment composed of various services while adhering to specific guidelines.

## Key Features

- **Service Isolation**: Each service runs in its own dedicated container, with Docker images named after the services.
- **Custom Dockerfiles**: Each service has a custom Dockerfile, and images are built locally without relying on pre-built images (excluding Alpine and Debian).
- **Required Services**:
  - **NGINX**: Configured to use only TLSv1.2 or TLSv1.3.
  - **WordPress + PHP-FPM**: Installed and configured without NGINX.
  - **MariaDB**: Operates independently without NGINX.
- **Persistent Storage**:
  - A volume for the WordPress database.
  - A separate volume for WordPress website files.
- **Networking**: A dedicated Docker network connects all containers, ensuring no use of host networking or links.
- **Container Management**: Containers are set to restart automatically in case of failure, avoiding hacky solutions like infinite loops.
- **Database Setup**: Two users in the WordPress database, with the administrator's username free from common admin terms.
- **Volume Accessibility**: Volumes are accessible at `/home/login/data` on the host machine.
- **Domain Configuration**: Custom domain (e.g., `login.42.fr`) points to your local IP address.

## Getting Started

1. Clone the repository.
2. Configure your virtual machine.
3. Build and run the services using Docker Compose.

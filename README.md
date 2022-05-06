# Local Environment

## Getting Started

### Prerequisites
- `Java` should be installed (v8.0 or more recent is fine but we prefer 11.0 and newer)
- `Maven` should be installed (recommended v3.8.5 or higher)
- `Docker` should be installed (recommended v20.10.14 or higher)
- `Docker Compose` should be installed (recommended v1.29.0 or higher)

## Using Local Environment

### Change Database Password
You should change the password for the database in the docker-compose.yml file.
```sh
environment:
        MYSQL_ROOT_PASSWORD: your-strong-password-here
```

### Change Target Directory
You should change the path to your target directory in the docker-compose.yml file.
```sh
volumes:
        - "path/to/target/:/opt/target/"
```

### Change Project Name
You should change the project name in the docker-compose.yml file to your actual project.
```sh
command: ["java","-jar","/opt/target/your-actual-project.jar"]
```

### Useful Commands
Here you will found some useful commands that you might use.
```sh
# Check versions.
sudo docker --version
sudo docker-compose --version

# Check if docker engine is running.
sudo service docker status
# If docker isn`t running you should start it.
sudo service docker start
# Stop docker engine.
sudo service docker stop

# Start docker compose in background.
sudo docker-compose up -d
# Stop docker compose.
sudo docker-compose down
# Show docker compose logs.
sudo docker-compose logs
# Show docker compose state.
sudo docker-compose ps
# Start docker compose service.
sudo docker-compose up -d service_name
# Restart docker-compose service.
sudo docker-compose restart service_name
# Execute a command in a container
sudo docker-compose exec -i container_name command_to_execute
```

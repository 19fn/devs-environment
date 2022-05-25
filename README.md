# Local Environment

## Getting Started

### Prerequisites
- `Java` should be installed (v8.0 or more recent is fine but we prefer 11.0 and newer)
- `Maven` should be installed (recommended v3.8.5 or higher)
- `Docker` should be installed (recommended v20.10.14 or higher)
- `Docker Compose` should be installed (recommended v1.29.0 or higher)

## Using Local Environment

### Change Database Environment Variables
You should change the environment variables for the database in the docker-compose.yml file.
```sh
environment:
	# Specify the password that will be set for the MySQL root superuser account
        MYSQL_ROOT_PASSWORD: MyStrongPassword123
        # Specify the name of a database to be created on startup
	MYSQL_DATABASE: DB_example
	# Used to create a new user
        MYSQL_USER: myuser
	# Set user password
        MYSQL_PASSWORD: MyUserPassword123
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
# Check ip address.
python3 getIP.py

# Check versions.
sudo docker --version
sudo docker-compose --version

# Check if docker engine is running.
sudo service docker status
# Start docker engine.
sudo service docker start
# Stop docker engine.
sudo service docker stop

# Start docker compose in background.
sudo docker-compose up -d
# Shutdown docker compose.
sudo docker-compose down
# Show docker compose logs.
sudo docker-compose logs
# Show docker compose state.
sudo docker-compose ps
# Start docker compose service.
sudo docker-compose up -d service_name
# Stop docker compose service.
sudo docker-compose stop service_name
# Restart docker-compose service.
sudo docker-compose restart service_name
# Execute command in a container
sudo docker exec -i container_name command_to_execute
```

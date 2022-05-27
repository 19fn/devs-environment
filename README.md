# Local Environment

## Getting Started

### Prerequisites
- `Java` should be installed (v11 or more recent is fine but we prefer 17 and newer)
- `Maven` should be installed (recommended v3.8.5 or higher)
- `Docker` should be installed (recommended v20.10.14 or higher)
- `Docker Compose` should be installed (recommended v1.29.0 or higher)

## Using Local Environment

### Change Database Environment Variables
You should change the environment variables for the mysql database in the docker-compose.yml file.
```sh
environment:
	# Specify the password that will be set for the MySQL root superuser account
        MYSQL_ROOT_PASSWORD: MyStrongPassword123
        # Specify the name of a database to be created on startup
	MYSQL_DATABASE: mydb
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

### phpMyAdmin
You should use the same credentials that you use in the mysql database. 
phpMyAdmin is a free software tool written in PHP, intended to handle the administration of MySQL over the Web.
```sh
phpMyAdmin run on http://localhost:8081
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
# All services
sudo docker-compose up -d
# One service
sudo docker-compose up -d mysql
sudo docker-compose up -d pma
sudo docker-compose up -d java
# Shutdown docker compose.
sudo docker-compose down
# Start docker compose container.
sudo docker-compose start mysql
sudo docker-compose start pma
sudo docker-compose start java
# Stop docker compose container.
sudo docker-compose stop mysql
sudo docker-compose stop pma
sudo docker-compose stop java
# Restart docker-compose container.
sudo docker-compose restart mysql
sudo docker-compose restart pma
sudo docker-compose restart java
# Show docker compose logs.
sudo docker-compose logs mysql
sudo docker-compose logs pma
sudo docker-compose logs java
# Show docker compose state.
sudo docker-compose ps
# Execute any given command within a container.
sudo docker exec -it mysql /bin/bash
sudo docker exec -it pma /bin/bash
sudo docker exec -it java /bin/bash
```

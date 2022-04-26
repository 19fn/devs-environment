# Local Environment

## Getting Started

### Prerequisites
- `Java` should be installed (v8.0 or more recent is fine but we prefer 11.0 and newer)
- `Maven` should be installed (recommended v3.8.5 or higher)
- `Docker` should be installed (recommended v20.10.14 or higher)
- `Docker Compose` should be installed (recommended v1.29.2 or higher)

## Using Local Environment

### Change Project Name
You need to change the project name in the docker-compose.yml file to your actual project
```sh
command: ["java","-jar","/opt/target/your-actual-project.jar"]
```

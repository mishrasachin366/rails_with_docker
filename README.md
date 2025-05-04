Create the New Rails app with Docker

# Step1(Task4): Create the new rails app if rails project not setup

    * gem install rails -v 7.2
    * rails new rails_with_docker -d postgresql
    * cd myapp
    * And set the database.yml file

# Step2: Install Docker on Ubuntu

    * Sudo apt update	#Update your system
    * sudo apt upgrade	#Update your system
    * sudo apt install apt-transport-https ca-certificates curl software-properties-common  #Install required dependencies
    * curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg	#Add Docker’s official GPG key
    * echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null	#Add Docker's official repository
    * sudo apt update	#sudo apt update
    * sudo apt install docker-ce	#Install Docker CE (Community Edition)
    * sudo systemctl status docker	#Check Docker installation
    * sudo curl -L "https://github.com/docker/compose/releases/download/$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r .tag_name)/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose	#Download the latest version of Docker Compose
    * sudo chmod +x /usr/local/bin/docker-compose	#Set executable permissions for Docker Compose
    * docker-compose –version	#Verify Docker Compose installation
    * sudo usermod -aG docker $USER	#(Optional) Add your user to the Docker group

# Step3(Task1 & Task2): Chetu Assignment

    * docker run hello-world	#Run a Simple Container
    * docker pull nginx		#pull an image
    * docker run -d -p 8080:80 nginx	#Run Ngnix Container
    * docker ps	#Find Container ID (Show only running container)
    * docker ps -a	#Show all containers, including stoped once
    * docker stop <container_id>	#Stop Container
    * docker start	#Start Container
    * docker logs <container_id>	#Show the logs
    * docker rm <container_id>	#Remove the Contaner
    * docker rmi <image_id>	#Remove the image

# Step4(Task3): Build and Run Custom Image

    * touch Dockerfile	#Create the Docker file
    * touch docker-compose.yml	#Create the Docker-Composer file
    * touch config/database.yml	#Create the database.yml file and Make sure that the username, password, and host are correctly configured for Docker.
---------------------------------------------------------------------------------------------------------------------
    * docker-compose up –build	#Now, you can build and start the containers using Docker Compose
    * docker-compose run web rake db:create db:migrate	#Once the containers are running, you need to run the database migrations. Open a new terminal and run
    * docker-compose down	   #To stop the containers
                        OR
    * docker build -t rails_with_docker .	   #Create and Build Image
    * docker run -d -p 3000:3000  rails_with_docker	#Run the Container
--------------------------------------------------------------------------------------------------------------------
    * docker volume create my_volume	#Create Volume
    * docker run -v my_volume:/myapp/data my-rails-app		#Run with Volume



# 1. What is Docker?
* Docker is an open-source platform used to automate the deployment, scaling, and management of applications inside containers. It allows developers to package applications and their dependencies into a container that can run on any machine.

# 2. What are the differences between Docker containers and virtual machines (Vms)?

* Containers: Lightweight, share the host OS kernel, fast startup, and smaller in size.
VMs: Require a hypervisor, include the full OS along with the application, and are more resource-intensive.

# 3. What is a Docker image?
* A Docker image is a lightweight, standalone, executable package that includes everything needed to run a piece of software: the code, runtime, libraries, environment variables, and configurations.

# 4. What is a Docker container?
* A container is a running instance of a Docker image. It can be started, stopped, moved, and deleted. Each container is isolated from others and the host system.

# 5. What is the Dockerfile?
* A Dockerfile is a text file that contains instructions on how to build a Docker image. It defines the base image, the steps to install dependencies, copy files, and set up the environment.

# 6. How do you create a Docker image from a Dockerfile?
* Use the following command:
    * docker build -t image_name .

# 7. What is Docker Compose?
* Docker Compose is a tool for defining and running multi-container Docker applications. You can use a docker-compose.yml file to configure all your services, and then start them with a single command.

# 8. How do you check running containers in Docker?
* Use the command:
    * docker ps

# 9. What is the difference between docker run and docker exec?
* docker run: Starts a new container from an image.
* docker exec: Executes a command inside a running container.

# 10. How do you share data between a host and a container?
* Docker uses volumes to persist data and share it between the host and containers. Volumes are stored outside the container filesystem and can be mounted into containers.

# 11. What is Docker Swarm?
* Docker Swarm is Docker's native clustering and orchestration tool that allows you to manage a cluster of Docker nodes and deploy services on them.

# 12. How can you stop a Docker container?
* Use the command:
    * docker stop container_id

# 13. What is the difference between a Docker image and a container?
* A Docker image is a blueprint for creating containers, whereas a container is a running instance of that image.

# 14. What are Docker volumes and how do they differ from bind mounts?
* Volumes: Managed by Docker and stored in a specific part of the host filesystem.
* Bind mounts: Allow you to mount any directory from the host machine into the container, giving you more control but with potential security risks.

# 15. How do you update a Docker container?
* Docker containers are immutable, meaning they cannot be updated directly. To update, you would typically stop and remove the existing container, and then create a new one from an updated image.

# 16. What is Docker Hub?
* Docker Hub is a cloud-based registry where Docker users can share and store Docker images. It is the default registry used when pulling images with Docker commands.

# 17. How can you remove unused Docker images, containers, and volumes?
* To clean up unused resources:
    * docker system prune

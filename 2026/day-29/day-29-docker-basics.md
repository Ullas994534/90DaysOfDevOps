### Day 29 – Introduction to Docker

## Task 1: What is Docker?
Ans: Docker is an OS‑level virtualization (or containerization) platform, which allows applications to share the host OS kernel instead of running a separate guest OS like in traditional virtualization. This design makes Docker containers lightweight, fast, and portable, while keeping them isolated from one another.

## Containers vs Virtual Machines — what's the real difference?

Ans: 

![screenshot1](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-29/images/Screenshot%20from%202026-03-03%2009-32-46.png)

Which to Use?
Use Containers for microservices, CI/CD, or when you need to deploy many instances of an application quickly.

Use Virtual Machines when you need to run different operating systems (e.g., Linux on Windows), require maximum security isolation, or are running legacy applications. 

## What is the Docker architecture? (daemon, client, images, containers, registry)
Ans: 

1) daemon: A daemon is a computer program that runs as a background process, operating independently of direct user control to handle tasks like system requests, network connections, or scheduling.

![screenshot2](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-29/images/Screenshot%20from%202026-03-03%2009-37-53.png)

2) client: The Docker client (CLI) sends a REST API request to the Docker daemon.

3) images: A Docker image is a snapshot or blueprint of the libraries and dependencies required inside a container for an application to run.

4) containers: It is the actual instance of an image. Application runs inside container isolated.

5) registry: Docker Registry is a centralized storage and distributed system for collecting and managing Docker images. 
            their are 2 types of registry.
            1) public: it as the dockerhub accessible to everyone to pull and push the images
            2) private: is your own private repository where you can store your own Docker images and  share  them with others.
            
Draw or describe the Docker architecture in your own words.

![screenshot3](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-29/images/Screenshot%20from%202026-03-03%2011-33-42.png)

##Task 2: Install Docker

Install Docker on your machine (or use a cloud instance)

Install Docker on your machine (or use a cloud instance)

Verify the installation

Run the hello-world container

Read the output carefully — it explains what just happened

![screenshot4](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-29/images/Screenshot%20from%202026-03-03%2011-50-08.png)

Task 3: Run Real Containers

Run an Nginx container and access it in your browser

![screenshot8](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-29/images/Screenshot%20from%202026-03-03%2014-31-12.png)

Run an Ubuntu container in interactive mode — explore it like a mini Linux machine

![screenshot5](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-29/images/Screenshot%20from%202026-03-03%2013-41-09.png)

![screenshot6](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-29/images/Screenshot%20from%202026-03-03%2013-41-27.png)

List all running containers

![screenshot7](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-29/images/Screenshot%20from%202026-03-03%2013-41-48.png)

## Stop and remove a container

![screenshot9](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-29/images/Screenshot%20from%202026-03-03%2014-38-38.png)

### Task 4: Explore

Run a container in detached mode — what's different?

Running a container in detached mode frees terminal, container run in background, we only get container id and manage it using docker commands with its id.
Running directly without -d, runs it in foreground, it shows live logs.outputs, pressing ctl+c stops it and exits container.

Give a container a custom name

Map a port from the container to your host

![screenshot10](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-29/images/Screenshot%20from%202026-03-03%2014-51-54.png)

![screenshot11](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-29/images/Screenshot%20from%202026-03-03%2014-52-19.png)

Deployed on nginx in container locally

![screenshot12](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-29/images/Screenshot%20from%202026-03-03%2015-23-02.png)






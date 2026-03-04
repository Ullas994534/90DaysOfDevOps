### Day 30 – Docker Images & Container Lifecycle

Challenge Tasks

Task 1: Docker Images

## Pull the nginx, ubuntu, and alpine images from Docker Hub

docker pull <images name>


## List all images on your machine — note the sizes

![screenshot1](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-30/images/Screenshot%20from%202026-03-04%2008-22-43.png)

## Compare ubuntu vs alpine — why is one much smaller?

ubuntu--> When you need full OS tools, debugging, or compatibility.

Alpine --> For small, simple, production containers.

## Inspect an image — what information can you see?

It shows details like:

Container ID
Image used
Status (running / exited)
IP address
MAC address
Ports mapping
Volumes / Mounts
Environment variables
Network settings
Created time
Command used to start container.

docker inspect <container_id>

## Remove an image you no longer need

docker rmi <image-id>

1) Run docker image history nginx — what do you see?
What do you see?

A list of layers

Each layer has:
IMAGE ID
CREATED time
CREATED BY (command used)
SIZE

2) Each line is a layer. Note how some layers show sizes and some show 0B.
    What do you see?
    A list of layers
    Each layer has:

    IMAGE ID
    CREATED time
    CREATED BY (command used)
    SIZE
    
3) Write in your notes: What are layers and why does Docker use them?
    Layers are read-only filesystem changes created by each Dockerfile instruction.

Example:
        FROM
        RUN
        COPY
        ADD
        Each creates a new layer.

![screenshot2](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-30/images/Screenshot%20from%202026-03-04%2008-33-55.png)

Task 3: Container Lifecycle

Practice the full lifecycle on one container:

Create a container (without starting it)
Start the container
Pause it and check status
Unpause it
Stop it
Restart it
Kill it
Remove it
Check docker ps -a after each step — observe the state changes.

![screenshot3](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-30/images/Screenshot%20from%202026-03-04%2008-44-52.png)

![screenshot4](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-30/images/Screenshot%20from%202026-03-04%2008-45-31.png)

## Task 4: Working with Running Containers

![screenshot5](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-30/images/Screenshot%20from%202026-03-04%2008-47-18.png)

![screenshot6](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-30/images/Screenshot%20from%202026-03-04%2008-53-05.png)

View real-time logs (follow mode)

![screenshot7](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-30/images/Screenshot%20from%202026-03-04%2008-54-25.png)

Run a single command inside the container without entering it

![screenshot8](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-30/images/Screenshot%20from%202026-03-04%2009-19-25.png)

Inspect the container — find its IP address, port mappings, and mounts.

![screenshot9](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-30/images/Screenshot%20from%202026-03-04%2009-26-30.png)

![screenshot10](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-30/images/Screenshot%20from%202026-03-04%2009-28-24.png)

![screenshot11](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-30/images/Screenshot%20from%202026-03-04%2009-29-18.png)

## Task 5: Cleanup

1. Stop all running containers in one command

![screenshot12](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-30/images/Screenshot%20from%202026-03-04%2009-30-08.png)

2. Remove all stopped containers in one command

![screenshot13](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-30/images/Screenshot%20from%202026-03-04%2009-32-05.png)

3. Using prune

![screenshot14](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-30/images/Screenshot%20from%202026-03-04%2009-33-14.png)

4. Remove unused images

![screenshot15](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-30/images/Screenshot%20from%202026-03-04%2009-34-11.png)

5. Check how much disk space Docker is using

![screenshot16](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-30/images/Screenshot%20from%202026-03-04%2009-35-40.png)

![screenshot17](https://github.com/Ullas994534/90DaysOfDevOps/blob/master/2026/day-30/images/Screenshot%20from%202026-03-04%2009-36-45.png)

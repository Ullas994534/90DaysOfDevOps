### Day 30 – Docker Images & Container Lifecycle

Challenge Tasks

Task 1: Docker Images

## Pull the nginx, ubuntu, and alpine images from Docker Hub

docker pull <images name>


## List all images on your machine — note the sizes

![screenshot1]()

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

![screenshot2]()

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

![screenshot3]()

![screenshot4]()

## Task 4: Working with Running Containers

![screenshot5]()

![screenshot6]()

View real-time logs (follow mode)

![screenshot7]()

Run a single command inside the container without entering it

![screenshot8]()

Inspect the container — find its IP address, port mappings, and mounts.

![screenshot9]()

![screenshot10]()

![screenshot11]()

## Task 5: Cleanup

1. Stop all running containers in one command

![screenshot12]()

2. Remove all stopped containers in one command

![screenshot13]()

3. Using prune

![screenshot14]()

4. Remove unused images

![screenshot15]()

5. Check how much disk space Docker is using

![screenshot16]()


### Day 31 – Dockerfile: Build Your Own Images

## Task 1 – First Dockerfile


1. Create a folder called my-first-image
2. Inside it, create a Dockerfile that:
    Uses ubuntu as the base image
    Installs curl
    Sets a default command to print "Hello from my custom image!"
3. Build the image and tag it my-ubuntu:v1
4. Run a container from your image

![screenshot1]()

![screenshot2]()

![screenshot3]()

## Task 2: Dockerfile Instructions

![screenshot5]()

![screenshot4]()

![screenshot6]()

## Observation:
Each instruction creates a new image layer. FROM → Base OS RUN → Executes during build WORKDIR → Set working directory COPY → Copy from host EXPOSE → Documentation only CMD → Default runtime command


Task 3: CMD vs ENTRYPOINT

1. Create an image with CMD ["echo", "hello"] — run it, then run it with a custom command. What happens?

Part 1: Using CMD

![screenshot7]()

Create Dockerfile (CMD Example)
dockerfile
FROM alpine
CMD ["echo", "hello"]

Build Image
docker build -t cmd-command .

Run Container (Default Command)
docker run cmd-command

## Output

Hello

Run with Custom Command

docker run cmd-command echo "Ullas Banamagi"

Output

Ullas Banamagi

Observation

The custom command replaces the CMD instruction.

2. Create an image with ENTRYPOINT ["echo"] — run it, then run it with additional arguments. What happens?

![screenshot8]()

![screenshot9]()

## Create Dockerfile (ENTRYPOINT Example)
FROM alpine
ENTRYPOINT ["echo"]

## Build Image

docker build -t entrypoint-demo .

## Run Container

docker run entrypoint-demo hello

## output

Hello

## Run with Additional Arguments

docker run entrypoint-demo "Ullas Banamagi"

Ullas Banamagi

Observation
Arguments provided during docker run are appended to the ENTRYPOINT command instead of replacing it.

![screenshot10]()

### Task 4: Build a Simple Web App Image

1. Create a small static HTML file (index.html) with any content

creating the index.html file using the touch command 

2. Create Dockerfile

FROM nginx:alpine
COPY index.html /usr/share/nginx/html

3. Build Docker Image

docker build -t website-page:v1 .

4. Run the Container

docker run -d -p 8081:80 --name mysite website:v1

![screenshot11]()

![screenshot12]()


## 5: Access the Website

![screenshot13]()

### Task 5: .dockerignore

1. Create a .dockerignore file in one of your project folders

Inside the project folder, I created a file named .dockerignore .

vim .dockerignore

![screenshot14]()

2. Add Ignore Rules

created the node_modeles and added the ignore file in that.
node_modules .git *.md .env

Explanation
node_modules → prevents large dependency folders from being copied
.git → excludes Git repository data
*.md → ignores markdown files
.env → prevents sensitive environment variables from being added

2. Create Static HTML File

created the index.html file for containing my Dockerized website content.

3. Create Dockerfile

FROM nginx:alpine
COPY index.html /usr/share/nginx/html/

4. Build the Docker Image

docker build -t ignore-test:v1 . (During the build process, Docker used .dockerignore to exclude specified files from the build context.)

5. Verify Ignored Files

I verified that ignored files were not copied into the image by running:

docker run -d -p 8081:80 --name docker-ignore ignore-test:v1

Then checking files inside the container:
ls -la /usr/share/nginx/html

The ignored folders and files (node_modules, .git, .md, .env) were not present inside the container.

![screenshot15]()


Learning Outcome

![screenshot16]()

6. Task 6: Build Optimization

1. Build an image, then change one line and rebuild — notice how Docker uses cache
2. Reorder your Dockerfile so that frequently changing lines come last
3. Write in your notes: Why does layer order matter for build speed?

![screenshot17]()

1. Create Initial Dockerfile
I created a Dockerfile with the following content:

dockerfile
FROM nginx:alpine
WORKDIR /usr/share/nginx/html
COPY index.html .
RUN echo "Building optimized image"
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]


2. Build the Image (First Build)
docker build -t optimize-test:v1 .

During the first build, Docker executed all steps because no cache existed.

3. Modify One Line
I updated the index.html file by changing some text content.

Example change:
Updated Docker Optimization Demo under header in index.html


4. Rebuild the Image
docker build -t optimize-demo:v2 .

Observation
Docker reused cached layers for unchanged instructions and rebuilt only the layers after the modified step.

Build output showed:
Using cache for earlier steps.

5. Optimize Dockerfile Order
I reordered the Dockerfile so frequently changing files are copied last.

Optimized Dockerfile

FROM nginx:alpine
RUN echo "created the small image and its small contanier"
WORKDIR /usr/share/nginx/html
EXPOSE 80
COPY index.html .
CMD ["nginx", "-g", "daemon off;"]


![screenshot18]()

![screenshot19]()

![screenshot20]()

Why Layer Order Matters in Docker

Docker builds images in layers.
Each instruction in a Dockerfile creates a cached layer.

	If an early layer changes → all layers after it rebuild.
	If frequently changing files are added at the end → earlier layers stay cached.
	Proper layer order = faster builds


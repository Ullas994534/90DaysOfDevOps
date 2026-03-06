### Day 32 – Docker Volumes & Networking

## Challenge Tasks

## Task 1: The Problem

1. Run a Postgres or MySQL container

docker run -d --name mysql-testing -e MYSQL ROOT_PASSWORD = test@123 mysql

![screenshot1]()

![screenshot2]()

2. Create some data inside it (a table, a few rows — anything)

![screenshot3]()

![screenshot4]()

3. Stop and remove the container

![screenshot5]()

4. Run a new one — is your data still there?

docker run -d --name mysql-testing -e MYSQL ROOT_PASSWORD = test@123 mysql

Write what happened and why.

Ans: The data is gone, because the container are temporary without a volume, data is stored inside the container filesystem — which is deleted when the container is removed.


## Task 2: Named Volumes (Data Persistence)

Step 1: Create Named Volume

2. Run the same database container, but this time attach the volume to it

![screenshot6]()

![screenshot7]()

3. Add some data, stop and remove the container.

![screenshot8]()

4. Run a brand new container with the same volume

![screenshot9]()

![screenshot10]()

Verify: docker volume ls, docker volume inspect

![screenshot11]()

![screenshot12]()


## Task 3: Bind Mounts

Create a folder on your host machine with an index.html file

docker run -d -v ~/docker-task3-practice/data:/usr/share/nginx/html/ -p 81:80 nginx

![screenshot15]()

Run an Nginx container and bind mount your folder to the Nginx web directory

![screenshot14]()

Access the page in your browser

![screenshot13]()

Named Volume : They are created and managed by docker. Stored in docker's internal storage directory. At initialization if volume is empty it copies container's data. More secure.

Bind Mount : They are created by users. Can be created anywhere in the file system. At initialization if volume is empty it obscure container's data. Less secure.

## Task 4: Docker Networking Basics

![screenshot16]()

Inspect the default bridge network

![screenshot17]()


Run two containers on the default bridge — can they ping each other by name?

Run two containers on the default bridge — can they ping each other by IP?


![screenshot18]()

On default bridge containers can't PING each other by NAME, But they can PING each other by IP.

### Task 5: Custom Networks


1. Create a custom bridge network called my-app-net

![screenshot19]()

2. Run two containers on my-app-net

docker run -itd --name ubuntu1 --network my-app-net ubuntu

docker run -itd --name ubuntu2 --network my-app-net ubuntu

![screenshot19]()

3. Can they ping each other by name now? YES

docker exec -it ubuntu1 bash

![screenshot20]()

Write in your notes: Why does custom networking allow name-based communication but the default bridge doesn't?

Custom networking enables built-in DNS, so container can resolve each other by name.
Default bridge does not enable built-in DNS, so it can only use IP address to ping.

## Task 6: Put It Together

1. Create a custom network
2. Run a database container (MySQL/Postgres) on that network with a volume for data
3. Run an app container (use any image) on the same network
4. Verify the app container can reach the database by container name

![screenshot21]()

![screenshot22]()

![screenshot23]()

![screenshot24]()

![screenshot25]()


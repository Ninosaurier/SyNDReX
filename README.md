# SyNDReX! A fully comprehensive Symfony, React, Nginx, MongoDb or MySQL Docker container.

## Introduction
The repo provides a complete React, Symfony, Nginx and MongoDb or MySQL environment in Docker.
SyDReXX stands for:
    - **Sy**mfony
    - **N**ginx
    - **D**ocker
    - **Re**act
    - **X** is a variable and stands for the database MongoDb or MySQL

Feel free to use the repo. I always try to keep the repo up to date. 
Please bear with me as I don't have much experience with Git and Docker yet.

The installation works for Linux. I do not know, if the installation works for the Windows subsystem. 
You are welcome to clone the repo and run it in Windows. I will gladly extend the description with a Windows chapter.

## Preconditions

### Check docker version
Make sure which Docker version you are using. make sure which Docker version you are using. 
If your version is greater than 2.0, then start the containers with `docker compose up <parameters>`.
If it is smaller than 2.0, then the command goes as follows: `docker-compose up <parameters>`. **Note the hyphen!**

## 1. Installation

### 1.1 Clone the project 
`git clone https://github.com/One-Type-Man/SyNDReX.git`

### 1.2 Go in the project folder
`cd SyNDReX`

### 1.3 Build the docker image:
`docker-compose build` or `docker compose build`. 

### 1.4 Start the containers
But before you start the containers, the line "command: npm start" in the _docker-compose.yml_, is commented out. This is important for the beginning, otherwise the _React container_ will *not start*! 
The command will start the React project, but will immediately print an error message, because there is no _package.json_. Therefore we have to comment out the line first.
Start the container: `docker-compose up -d` or `docker compose up -d`.

With `docker ps` you will have the following output:

```bash
> $ docker-compose ps
        Image ...     Ports                                                Names
--------------------------------------------------------------------------------------------------
syndrex_react         0.0.0.0:3000->3000/tcp, :::3000->3000/tcp            react
syndrex_nginx         0.0.0.0:80->80/tcp, :::80->80/tcp, 9001/tcp          nginx
syndrex_symfony       0.0.0.0:9001->9001/tcp, :::9001->9001/tcp            symfony
mongo                 0.0.0.0:8081->8081/tcp, :::8081->8081/tcp, 27017/tcp mongo_database
```

### 1.5 Initialize the React project. 
The recommended working directory is **/var/www/frontend** of the react container. You can change this in the _./react/Dockerfile_.
Now, create the react project with following command: `docker exec -it react sh /usr/share/scripts/initReactProject.sh`
The working directory is declared as _:cached_, so you will find (after restarting all container in chapter 1.7) the new initialized project in _./workdir/frontend/_.

### 1.6 Initialize the Symfony project
To create the Symfony project you need the initSymfonyProject.sh script. 
You start it with the command: `docker exec -it react sh /usr/share/scripts/initReactProject.sh <symfony_project_name>`

### 1.7 Remove the comment
Open the docker-compose.yml file and enable the line _command: npm start_. Then restart the containers with `docker-compose up -d` or `docker compose up -d`.

### 1.8 Try it!
Open your browser and make sure everything worked. 
The React container can be accessed via the URL `http://react.localhost` and the Symfony container via `http://symfony.localhost`.

### 1.9 Do you need MySQL? Edit the docker-compose.yml
If you need MySQl, comment out the section after "db", and enable the lines needed for the MySQL container.
In the Symfony section, you would then also have to activate the correct lines under "links". Of course you can also create a MongoDB and MySQL container.

### Nginx logs
The logs are cached and you will find them in project folder _workDir/logs_.

## Useful Commands

- Shows all running containers: `docker ps`
- If you want to use the shell from the container itself: `docker exec -it <container_name> sh`

## FAQ

#### How can i change the user ownership? I can not edit files. 
- Command: `sudo chown -R $USER`.

#### How can I change the working directory of a Docker container?
- Please make yourself familiar with the commands of [Docker](https://docs.docker.com/compose/). Use the respective "Dockerfile" for changes. 
- For example, I saved the working directory of the React container in a variable. 
- If you change it there, it should be applied everywhere. Try to make changes meaningful. If something doesn't work, feel free to contact me.

# License
Legally, I don't know if I can declare the repo with a GPL3 license.

But definitely feel free to copy, modify or even improve the repo. 
I have one request: If you have any improvements, please let me know. Would love to include them too :)
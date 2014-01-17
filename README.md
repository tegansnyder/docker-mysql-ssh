# docker-mysql-ssh
================

Docker container with Mysql and SSH. Pieced together from other repos like: https://github.com/abulte/docker-mysql

Build and run:
<pre>
git clone https://github.com/tegansnyder/docker-mysql-ssh.git
cd docker-mysql-ssh
docker build -t your-nickname .
docker run -d your-nickname
</pre>

MySQL credentials are: `root / root4mysql`.

Additional:
========================

Listing docker containers:
* `docker ps`

Stopping a docker container:
* `docker stop CONTAINERID`

If you want to find the IP of your docker interface you can ssh into it:
* `docker inspect CONTAINERID`

Once you find the IP of it you can SSH from your Vagrant VM into your Docker VM if you need to tune anything using the password you set in the Dockerfile... (defaults to "testpass")
* `ssh root@DOCKER_IP`

If you make some changes to the Dockerfile you can rebuild the container without having to go through the whole installation. Simply stop the docker container then issue:
* `sudo docker build -rm .`
* `sudo docker build -t="your-docker-name" -rm .`

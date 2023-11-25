# syntax = docker/dockerfile:1
FROM ubuntu:23.10

# Update and upgrade OS
RUN apt-get update && apt-get upgrade -y

# Install git
RUN apt-get install -y git

# Set timezone
ENV TZ=America/Bogota
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get install -y tzdata

# Install Python3, pip package manager
RUN apt-get install -y python3 python3-pip python3-virtualenv

# Create directory for the project and clone from GitHub
RUN mkdir -p /opt/labfinal
WORKDIR /opt/labfinal
RUN git clone https://github.com/Davlopez06/StarWars.git .

# Create Python Virtual Env
ENV VIRTUAL_ENV=/opt/labfinal/venv
RUN python3 -m virtualenv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Install project dependencies (if any)
RUN pip3 install -r requirements.txt  # Modify this according to your project setup

# Set the entry point or default command
ENTRYPOINT [ "/opt/labfinal/venv/bin/python3" , "server.py" ]

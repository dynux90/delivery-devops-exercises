# Delivery exercise 1

## Exercise

I have completed the following steps:

1. create a docker compose with two services:
    - db: mysql/mariadb
    - web: webserver of your choice to serve the php script

2. create a jenkins pipeline that achieve the following tasks:
    - build docker image that contains the web application
    - push the image to a container registry

3. create an ansible playbook that runs following tasks:
    - ensure target machine has prerequisites
    - pull compose from git repository on target
    - run services on target machine

4. create public git repository to push your work


## Delivery

Please note:

- step 2: i have created a brandnew jenkins instance to test the pipeline to push the images

- step 3: use playbook.yml to start all the chained playbooks

- step 3.1:  has been tested in a local environment, the invetory files needs to be adapted as the users and keys to connect to.


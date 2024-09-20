# Inception ✅100/100
Virtualization of docker images

The goal of the project is to create a wordpress website using mariaDB, nginx and, of couse, wordpress.

To run the project, clone the repo and run the Makefile :
```shell
  make        # Build the docker images and run the website
  make up     # Activate the website if it's down
  make down   # Deactivate the website if it's up
  make fclean # Destroy the docker images and the persistants datas /!\
  make re     # Destroy & rebuild the docker images and persistants datas /!\
```
Then you should be able to connect to the website on https://localhost/

(The project require you to connect to https://"your login".42.fr/, to do this, edit the /etc/hosts file and replace localhost by the correct domain)


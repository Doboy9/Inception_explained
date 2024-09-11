# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dboire <dboire@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/07 11:15:41 by dboire            #+#    #+#              #
#    Updated: 2024/09/11 16:17:04 by dboire           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SHELL := /bin/bash # Allow to run the bash script below

# sudo mkdir -p /home/dboire/data/mysql -> Create the mysql directory that we will use to keep the database data
# @sudo mkdir -p /home/dboire/data/wordpress -> Create the wordpress directory that we will use to keep the wordpress data
# @sudo docker-compose -f docker_compose.yml up -d -> Launch the docker-compose.yml that will setup all our dockers, and rebuild all the images, and remove orphans containers not defined in the docker-compose.yml


all :
	@sudo mkdir -p /home/dboire/data/mysql
	@sudo mkdir -p /home/dboire/data/wordpress
	@sudo docker-compose -f srcs/docker-compose.yml up -d --build --remove-orphans
	@echo "Wait 5 seconds for the site to be online"
	@for i in {1..5}; do \
		echo -n "."; \
		sleep 1; \
	done
	@echo -e "\nSite should be online now."

# @-docker compose -f docker_compose.yml stop -> silently stops Docker containers defined in docker_compose.yml, ignoring any errors.
# @docker system prune -a -f -> silently removes all unused Docker data
# @docker network prune -f -> removes all unused Docker networks
# @-docker volume rm srcs_database srcs_wordpress -> removes all the volumes that we mounted during the make on our pc
# @sudo rm -rf /home/dboire/data/mysql -> remove the mysql directory where we used to keep the database data
# @sudo rm -rf /home/dboire/data/wordpress -> remove the wordpress directory where we used to keep the wordpress data

down :
	@-docker compose -f srcs/docker-compose.yml stop
	@-docker system prune -a -f
	@-docker network prune -f
	@-docker volume prune -f
	@-docker volume rm srcs_database srcs_wordpress
	@-sudo rm -rf /home/dboire/data
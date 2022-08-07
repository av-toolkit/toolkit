#!/bin/bash

#Author: James Sanders
#Date: 03/07/2022

###########################
##  Live Docker Updates  ##
###########################

# # COPY AUTOWARE-CONTENTS DIR TO RUNNING DOCKER
 docker ps | grep -Eo '([0-9]|[a-z]){12}' | xargs -I %% docker cp $CARLA_AUTOWARE_CONTENTS %%:/home/autoware/autoware-contents

    ##################

# CREATE DOCUMENTS FOLDER IN RUNNING DOCKER
docker ps | grep -Eo '([0-9]|[a-z]){12}' | xargs -I %% docker exec --user autoware -i %% mkdir ./Documents
#sleep 0s  # Waits 5 seconds.

    ##################

# COPY PATCH FILE TO RUNNING DOCKER
docker ps | grep -Eo '([0-9]|[a-z]){12}' | xargs -I %% docker cp /home/$(whoami)/Tool-kit/assessment_toolkit/ros_patch/patch_files/update_vehicle_model.launch.patch %%:/home/autoware/Documents
#sleep 0s  # Waits 5 seconds.

# RUN THE PATCH FILE
docker ps | grep -Eo '([0-9]|[a-z]){12}' | xargs -I %% docker exec --user autoware -i %% patch Autoware/install/vehicle_description/share/vehicle_description/launch/vehicle_model.launch ./Documents/update_vehicle_model.launch.patch
#sleep 0s  # Waits 5 seconds.

    ##################

# COPY PATCH FILE TO RUNNING DOCKER
docker ps | grep -Eo '([0-9]|[a-z]){12}' | xargs -I %% docker cp /home/$(whoami)/Tool-kit/assessment_toolkit/ros_patch/patch_files/update_my_mission_planning.patch %%:/home/autoware/Documents
#sleep 0s  # Waits 5 seconds.

# RUN THE PATCH FILE
docker ps | grep -Eo '([0-9]|[a-z]){12}' | xargs -I %% docker exec --user autoware -i %% patch carla-autoware/carla-autoware-agent/agent/launch/my_mission_planning.launch ./Documents/update_my_mission_planning.patch
#sleep 0s  # Waits 5 seconds.

    ##################

# COPY EGOCAR SCRIPT TO RUNNING DOCKER
docker ps | grep -Eo '([0-9]|[a-z]){12}' | xargs -I %% docker cp /home/$(whoami)/Tool-kit/assessment_toolkit/ros_patch/scenarios/follow_vehicle.sh %%:/home/autoware/Documents
#sleep 0s  # Waits 5 seconds.

# RUN THE EGOCAR SCRIPT
docker ps | grep -Eo '([0-9]|[a-z]){12}' | xargs -I %% docker exec --user autoware -i %% bash /home/autoware/Documents/follow_vehicle.sh

# MAKE SCRIPT EXECUTABLE
docker ps | grep -Eo '([0-9]|[a-z]){12}' | xargs -I %% docker exec %% chmod +x /home/autoware/Documents/follow_vehicle.sh
#sleep 0s  # Waits 5 seconds.

# RUN SCRIPT
docker ps | grep -Eo '([0-9]|[a-z]){12}' | xargs -I %% docker exec --user autoware -i %% /home/autoware/Documents/follow_vehicle.sh
#sleep 0s  # Waits 5 seconds.

    ##################

# RUN SIMULATION
docker ps | grep -Eo '([0-9]|[a-z]){12}' | xargs -I %% docker exec --user autoware --env-file="/home/$(whoami)/Documents/new-mods/env-list" %% roslaunch carla_autoware_agent carla_autoware_agent.launch town:=Town01 spawn_point:='338.761,-320.678,0.2,0,0,90'
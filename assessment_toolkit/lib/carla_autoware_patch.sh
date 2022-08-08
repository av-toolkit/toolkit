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

    ##################

# COPY PATCH FILE TO RUNNING DOCKER
docker ps | grep -Eo '([0-9]|[a-z]){12}' | xargs -I %% docker cp /home/$(whoami)/Tool-kit/assessment_toolkit/ros_patch/patch_files/update_vehicle_model.launch.patch %%:/home/autoware/Documents

# RUN THE PATCH FILE
docker ps | grep -Eo '([0-9]|[a-z]){12}' | xargs -I %% docker exec --user autoware -i %% patch Autoware/install/vehicle_description/share/vehicle_description/launch/vehicle_model.launch ./Documents/update_vehicle_model.launch.patch

    ##################

# COPY PATCH FILE TO RUNNING DOCKER
docker ps | grep -Eo '([0-9]|[a-z]){12}' | xargs -I %% docker cp /home/$(whoami)/Tool-kit/assessment_toolkit/ros_patch/patch_files/update_my_mission_planning.patch %%:/home/autoware/Documents

# RUN THE PATCH FILE
docker ps | grep -Eo '([0-9]|[a-z]){12}' | xargs -I %% docker exec --user autoware -i %% patch carla-autoware/carla-autoware-agent/agent/launch/my_mission_planning.launch ./Documents/update_my_mission_planning.patch
#!/bin/bash
#sudo chmod 666 /var/run/docker.sock
###########################
##  Live Docker Updates  ##
###########################
printf "██████╗░░█████╗░░██████╗  ██████╗░░█████╗░████████╗░█████╗░██╗░░██╗\n██╔══██╗██╔══██╗██╔════╝  ██╔══██╗██╔══██╗╚══██╔══╝██╔══██╗██║░░██║\n██████╔╝██║░░██║╚█████╗░  ██████╔╝███████║░░░██║░░░██║░░╚═╝███████║\n██╔══██╗██║░░██║░╚═══██╗  ██╔═══╝░██╔══██║░░░██║░░░██║░░██╗██╔══██║\n██║░░██║╚█████╔╝██████╔╝  ██║░░░░░██║░░██║░░░██║░░░╚█████╔╝██║░░██║\n╚═╝░░╚═╝░╚════╝░╚═════╝░  ╚═╝░░░░░╚═╝░░╚═╝░░░╚═╝░░░░╚════╝░╚═╝░░╚═╝\n\\n\\n"
# # COPY AUTOWARE-CONTENTS DIR TO RUNNING DOCKER
# docker ps | grep -Eo '([0-9]|[a-z]){12}' | xargs -I %% docker cp ~/carla-autoware/autoware-contents %%:/home/autoware/autoware-contents

    ##################

# CREATE DOCUMENTS FOLDER IN RUNNING DOCKER
#docker ps | grep -Eo '([0-9]|[a-z]){12}' | xargs -I %% docker exec --user autoware -i %% mkdir ./Documents
#sleep 0s  # Waits 5 seconds.
    ##################

# COPY PATCH FILE TO RUNNING DOCKER
#docker ps | grep -Eo '([0-9]|[a-z]){12}' | xargs -I %% docker cp /home/bitcoin/AV-Tester-01/assessment_toolkit/ros_patch/patch_files/update_vehicle_model.launch.patch %%:/home/autoware/Documents
#sleep 0s  # Waits 5 seconds.
# RUN THE PATCH FILE
#docker ps | grep -Eo '([0-9]|[a-z]){12}' | xargs -I %% docker exec --user autoware -i %% patch Autoware/install/vehicle_description/share/vehicle_description/launch/vehicle_model.launch ./Documents/update_vehicle_model.launch.patch
#sleep 0s  # Waits 5 seconds.
    ##################

# COPY PATCH FILE TO RUNNING DOCKER
#docker ps | grep -Eo '([0-9]|[a-z]){12}' | xargs -I %% docker cp /home/bitcoin/AV-Tester-01/assessment_toolkit/ros_patch/patch_files/update_my_mission_planning.patch %%:/home/autoware/Documents
#sleep 0s  # Waits 5 seconds.
# RUN THE PATCH FILE
#docker ps | grep -Eo '([0-9]|[a-z]){12}' | xargs -I %% docker exec --user autoware -i %% patch carla-autoware/carla-autoware-agent/agent/launch/my_mission_planning.launch ./Documents/update_my_mission_planning.patch
#sleep 0s  # Waits 5 seconds.
    ##################

# COPY EGOCAR SCRIPT TO RUNNING DOCKER
docker ps | grep -Eo '([0-9]|[a-z]){12}' | xargs -I %% docker cp /home/bitcoin/AV-Tester-01/assessment_toolkit/ros_patch/scenarios/follow_vehicle.sh %%:/home/autoware/Documents
sleep 0s  # Waits 5 seconds.
# RUN THE EGOCAR SCRIPT
docker ps | grep -Eo '([0-9]|[a-z]){12}' | xargs -I %% docker exec --user autoware -i %% bash /home/autoware/Documents/follow_vehicle.sh

# MAKE SCRIPT EXECUTABLE
docker ps | grep -Eo '([0-9]|[a-z]){12}' | xargs -I %% docker exec %% chmod +x /home/autoware/Documents/follow_vehicle.sh
sleep 0s  # Waits 5 seconds.
# RUN SCRIPT
docker ps | grep -Eo '([0-9]|[a-z]){12}' | xargs -I %% docker exec --user autoware -i %% /home/autoware/Documents/follow_vehicle.sh
sleep 0s  # Waits 5 seconds.
#COPY THE RUN SIMULATION SCRIPT 
docker ps | grep -Eo '([0-9]|[a-z]){12}' | xargs -I %% docker cp /home/bitcoin/AV-Tester-01/assessment_toolkit/ros_patch/run.sh %%:/home/autoware
#sleep 0s  # Waits 5 seconds.
# # MAKE SCRIPT EXECUTABLE
docker ps | grep -Eo '([0-9]|[a-z]){12}' | xargs -I %% docker exec %% chmod +x /home/autoware/run.sh
#sleep 0s  # Waits 5 seconds.
# RUN THE ROSLAUNCH SCRIPT
docker ps | grep -Eo '([0-9]|[a-z]){12}' | xargs -I %% docker exec --user autoware subprocess.Popen("docker ps | grep -Eo '([0-9]|[a-z]){12}' | xargs -I %% docker exec --user autoware --env-file='$TOOLKIT_ROOT/env-list' -i %% bash /home/autoware/run.sh

printf "\n\n███████╗██╗███╗░░██╗██╗░██████╗██╗░░██╗███████╗██████╗░\n██╔════╝██║████╗░██║██║██╔════╝██║░░██║██╔════╝██╔══██╗\n█████╗░░██║██╔██╗██║██║╚█████╗░███████║█████╗░░██║░░██║\n██╔══╝░░██║██║╚████║██║░╚═══██╗██╔══██║██╔══╝░░██║░░██║\n██║░░░░░██║██║░╚███║██║██████╔╝██║░░██║███████╗██████╔╝\n╚═╝░░░░░╚═╝╚═╝░░╚══╝╚═╝╚═════╝░╚═╝░░╚═╝╚══════╝╚═════╝░\n"

sleep 10

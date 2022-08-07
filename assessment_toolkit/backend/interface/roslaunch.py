#!/usr/bin/env python

"""roslaunch.py: Starts Roslaunch by injecting command into live CARLA-Autoware Docker"""

"""
@Author: James Sanders
@Date: 07/08/2022
"""

import os
import subprocess

class Roslaunch:

    def start(self):
        subprocess.Popen("docker ps | grep -Eo '([0-9]|[a-z]){12}' | xargs -I %% docker exec --user autoware --env-file='/home/$(whoami)/Documents/new-mods/env-list' %% roslaunch carla_autoware_agent carla_autoware_agent.launch town:=Town01", stdout=subprocess.PIPE, shell=True) 

    def kill(self):
        subprocess.Popen("docker ps | grep -Eo '([0-9]|[a-z]){12}' | xargs -I %% docker exec --user autoware %% kill $(ps aux | grep 'roslaunch' | awk '{print $2}')", stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)

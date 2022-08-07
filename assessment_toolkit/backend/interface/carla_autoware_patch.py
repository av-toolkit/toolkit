#!/usr/bin/env python

"""carla_autoware_patch.py: Patches the CARLA-Autoware Docker live"""

"""
@Author: James Sanders
@Date: 07/08/2022
"""

import os
import subprocess

class CarlaAutowarePatch:

    def start(self):
        subprocess.Popen("/home/$(whoami)/Tool-kit/assessment_toolkit/ros_patch/setup_carla_autoware_docker_container.sh", stdout=subprocess.PIPE, shell=True)         
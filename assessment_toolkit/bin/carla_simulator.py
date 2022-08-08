#!/usr/bin/env python

"""carla_simulator.py: Holds the methods to start & kill the CARLA-Simulator"""

"""
@Author: James Sanders
@Date: 07/08/2022
"""

import os
import subprocess

class CarlaSimulator:

    def start(self):
        subprocess.Popen("$CARLA_SIM/CarlaUE4.sh -carla-server -quality-level=Low", stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)

    def kill(self):
        subprocess.Popen("kill $(ps aux | grep 'CarlaUE4' | awk '{print $2}')", stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
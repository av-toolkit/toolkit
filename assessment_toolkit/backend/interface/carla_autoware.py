#!/usr/bin/env python

"""carla_autoware.py: Holds the methods to start & kill the CARLA-Autoware Docker"""

"""
@Author: James Sanders
@Date: 07/08/2022
"""

import os
import subprocess

class CarlaAutoware:

    def start(self):
        subprocess.Popen("$CARLA_AUTOWARE_ROOT/run.sh -s", stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)

    def kill(self):
        subprocess.Popen("docker ps | grep -Eo '([0-9]|[a-z]){12}' | xargs -I %% docker kill %%", stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
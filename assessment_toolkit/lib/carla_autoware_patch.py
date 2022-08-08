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
        subprocess.Popen("$TOOLKIT_ROOT/assessment_toolkit/etc/carla_autoware_patch.sh", stdout=subprocess.PIPE, shell=True)         
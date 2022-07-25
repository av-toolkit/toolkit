import os
import subprocess

class ROSLaunch:
    
    __ros__ = None

    def __init__(self, CARLA_AUTOWARE_PATH):
        print("CARLA_AUTOWARE_PATH " + CARLA_AUTOWARE_PATH)
        #self.__ros__ = os.system("gnome-terminal -e 'bash -c \"sudo " + CARLA_AUTOWARE_PATH + "run.sh -s; exec bash\"'")
        self.__ros__ = os.system("gnome-terminal --working-directory="+CARLA_AUTOWARE_PATH+" -e 'bash -c \"echo \'░█████╗░░█████╗░██████╗░██╗░░░░░░█████╗░\';echo \'██╔══██╗██╔══██╗██╔══██╗██║░░░░░██╔══██╗\';echo \'██║░░╚═╝███████║██████╔╝██║░░░░░███████║\';echo \'██║░░██╗██╔══██║██╔══██╗██║░░░░░██╔══██║\';echo \'╚█████╔╝██║░░██║██║░░██║███████╗██║░░██║\';echo \'░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝╚══════╝╚═╝░░╚═╝\';echo \'░█████╗░██╗░░░██╗████████╗░█████╗░░██╗░░░░░░░██╗░█████╗░██████╗░███████╗\';echo \'██╔══██╗██║░░░██║╚══██╔══╝██╔══██╗░██║░░██╗░░██║██╔══██╗██╔══██╗██╔════╝\';echo \'███████║██║░░░██║░░░██║░░░██║░░██║░╚██╗████╗██╔╝███████║██████╔╝█████╗░░\';echo \'██╔══██║██║░░░██║░░░██║░░░██║░░██║░░████╔═████║░██╔══██║██╔══██╗██╔══╝░░\';echo \'██║░░██║╚██████╔╝░░░██║░░░╚█████╔╝░░╚██╔╝░╚██╔╝░██║░░██║██║░░██║███████╗\';echo \'╚═╝░░╚═╝░╚═════╝░░░░╚═╝░░░░╚════╝░░░░╚═╝░░░╚═╝░░╚═╝░░╚═╝╚═╝░░╚═╝╚══════╝\'; echo ; echo *You will be prompted when you need to use this terminal from:; echo 𝗔𝘀𝘀𝗲𝘀𝘀𝗺𝗲𝗻𝘁 𝗧𝗼𝗼𝗹𝗸𝗶𝘁 𝗙𝗼𝗿 𝗦𝗮𝗳𝗲 𝗦𝗲𝗹𝗳 𝗗𝗿𝗶𝘃𝗶𝗻𝗴 𝗖𝗮𝗿𝘀 Window;echo ; echo ;echo ===INSTRUCTIONS===;echo ; echo =START DOCKER=; echo sudo ./run.sh; echo ;echo =START SIMULATION=; echo ./Documents/run-simulation.bash; echo =STOP SIMULATION=; echo ; echo CONTROL+C; echo ; echo =RESTART SIMULATION=; echo CONTROL+C;echo ./Documents/run-simulation.bash; echo ; exec bash\"'")


    def get_ros_launch(self):
        return self.__ros__

    

            
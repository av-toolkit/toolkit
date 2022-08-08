import time
import os
import subprocess
import signal
import PySimpleGUI as sg

from backend.interface import carla_simulator as cs
from backend.interface import carla_autoware as ca
from backend.interface import carla_autoware_patch as cap
from backend.interface import roslaunch as ros
from backend.scenario import follow_vehicle as fv

# Tool-kit
carla_simulator = cs.CarlaSimulator()
carla_autoware = ca.CarlaAutoware()
carla_autoware_patch = cap.CarlaAutowarePatch()
roslaunch = ros.Roslaunch()

# Scenarios
follow_vehicle = fv.ScenarioFollowVehicle()


#Handle Object Events and return the action that needs to be taken
def parse_event(window):

    event, values = window.read(timeout=100)
        # keep an animation running so show things are happening

    #if event not in (sg.TIMEOUT_EVENT, sg.WIN_CLOSED):
        #pass
        # print('============ Event = ', event, ' ==============')
        # print('-------- Values Dictionary (key=value) --------')
        # for key in values:
        #     print(key, ' = ',values[key])


    if event in (None, 'Exit'):
        print("[LOG] Clicked Exit!")
        return {"event_name":"close_window"}

    # If Start CALRA Sim Button Clicked
    elif event == 'Start Carla Sim':
        print("Starting CARLA Simulator")      
        carla_simulator.start()
    
    # If Kill CALRA Sim Button Clicked
    elif event == 'Kill Carla Sim':
        print("Killing CARLA Simulator")  
        carla_simulator.kill()

    # If Start CALRA-Autoware Button Clicked
    elif event == 'Start Carla-Autoware':
        print("Starting CARLA-Autoware")      
        carla_autoware.start()
    
    # If Kill CALRA-Autoware Button Clicked
    elif event == 'Kill Carla-Autoware':
        print("Killing CARLA-Autoware")  
        carla_autoware.kill()

    # If Start Patch Button Clicked
    elif event == 'Start Carla-Autoware Patch':
        print("Patching CARLA-Autoware")
        carla_autoware_patch.start()
        time.sleep(10)
        print("Patch Complete")
       
    # If Start Roslaunch Clicked
    elif event == 'Start Roslaunch':
        print("Starting Roslaunch")
        roslaunch.start()

    elif event == 'Start Follow Vehicle':
        print("Starting Roslaunch")
        roslaunch.start()
        time.sleep(10)
        print("Roslaunch Started")
        print("Starting Follow Vehicle Scenario")
        follow_vehicle.run_patch()
        follow_vehicle.run()


    elif event == '2D Pose Estimation Has Been Set':
        return {"event_name":"start_scenario_run"}

  
    #Continue is within the event because multiple continue buttons rendered make Continue, Continue2, Continue3
    elif 'Continue' in event:
        form_data = {}
        for key in values:
            print(key, ' = ',values[key])
            form_data[key] = values[key]
        return {"event_name":"continue", "data":form_data}
    
    elif event == 'Next':
        print('elif event == Next:')

        return {"event_name":"next"}

    elif event == '(CONFIRM) Step(3) is complete':

        print("event_handler.py (CONFIRM) Step(3) is complete");
        return {"event_name":"carla_autoware_docker_container_loaded"}

    elif event == 'Run Patch':
        return {'event_name': 'run_patch'}

    elif event == 'Patch has Finished':
        return {'event_name': 'patch_has_finished'}

    elif '(CONFIRM) RVIZ has loaded' in event:
        print("event_handler.py (CONFIRM) RVIZ has loaded");
        return {'event_name': 'start_scenario_run'}

    elif event == '(CONFIRM) Terminal process has stopped':
        return {'event_name': 'next_metamorphic_test'}

    elif event == 'View Results':
        return {'event_name': 'view_results'}


    return {"event_name":"none"}
        

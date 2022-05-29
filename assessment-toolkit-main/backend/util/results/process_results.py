
from concurrent.futures import ProcessPoolExecutor
from unittest import result
from result_data import ResultData

import csv

class ProcessResult():

    #results an array of result_data

    result_data_list = []

    def __init__(self, file_name):
        with open('../../../../'+file_name) as csv_file:
            csv_reader = csv.reader(csv_file, delimiter=',')          
            for row in csv_reader:
                self.result_data_list.append(ResultData(row[0],row[1],row[2],row[3],row[4],row[5],row[6],row[7],row[8]))


    def get_result_data(self):
        return self.result_data_list


    def had_collision(self):
        
        for result_data in self.get_result_data():
            if(result_data.get_collision > 0.0):
                return True
        return False
    
    def had_lane_invasion(self):
        for result_data in self.get_result_data():
            if(result_data.get_lane_invasion > 0.0):
                return True
        return False

    
    
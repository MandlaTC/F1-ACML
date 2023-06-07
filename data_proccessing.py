from db_driver import create_connection, execute_read_query
import numpy as np 

collect_training_data_query = "SELECT q1, q2, q3, races.circuitId \
from  races, drivers, constructors, qualifying \
where races.raceId=qualifying.raceId and constructors.constructorId = qualifying.constructorId \
and qualifying.driverId = drivers.driverId and !(q3= '' or q3= '""') \
and races.year >= 2006 and races.year <= 2021 ORDER BY races.year;"

#TODO: Create Methods to collect data and clean it of outliers that will skew the training process

#TODO: Create Methods to create training data two arrays (the q1 and q2 lap times in one and the q3 target time in the other).

def convert_time_to_milliseconds(time):
    
    milliseconds = int(time[1])*60000
    milliseconds = milliseconds + int(time[3:5])*1000
    milliseconds = milliseconds + int(time[6:8])
    return milliseconds

def convert_milliseconds_to_seconds(milliseconds):
    
    seconds = milliseconds * 0.001
    return seconds

def check_outlier(q1, q2, q3):
    avg = (q1+q2)/2
    if(q3>avg*1.02 or q3<avg*0.98):
        return False
    return True

# This function clears the qualifying data of outliers that may have been caused by any interuption to a lap
# Input:
# Returns
def clear_outliers(data):
    q1 = convert_time_to_milliseconds(data[0][0])
    q2 = convert_time_to_milliseconds(data[0][1])
    q3 = convert_time_to_milliseconds(data[0][2])
    circuitId = data[0][3]
    temp1 = np.array([q1, q2, circuitId])
    temp2 = np.array([q3])
    x  = np.array([[q1,q2, circuitId]])
    y = np.array([[q3]])
    for i in range(1, len(data)):
        if((data[i][0] != '""' and data[i][1] != '""' and data[i][2] != '""' )):
            q1 = convert_time_to_milliseconds(data[i][0])
            q2 = convert_time_to_milliseconds(data[i][1])
            q3 = convert_time_to_milliseconds(data[i][2])
            circuitId = data[i][3]
            if(check_outlier(q1, q2, q3)):
                temp1 = np.array([q1, q2, circuitId])
                temp2 = np.array([q3])
                x  = np.vstack([x, temp1])
                y =  np.vstack([y, temp2])
    print(len(x))
    return x, y

# This function creates an array of data used for traing the qualifying prediction model. 
# qualifying_time_period:
# circuits:
# Returns
def create_training_data():

    print("Enter Database Password")
    connection = create_connection("localhost", "root", input())

    training_data = execute_read_query(connection, collect_training_data_query)

    training_data, target_data = clear_outliers(training_data)

    return training_data, target_data

"""training_data, target_data = create_training_data()
for i in range (10):
    print(training_data[i], target_data[i])
    print() """
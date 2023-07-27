from time import sleep, time
from datetime import datetime,timedelta

def time_config_input():
    print ("Configuring timer/alarm")
    secs  = int(input("Enter seconds: "))
    mins  = int(input("Enter minutes: "))
    hours = int(input("Enter hours: "))
    return secs,mins,hours
    
def time_config_display(secs,mins,hours):
    print("Showing timer parameters")
    print("Seconds:", secs)
    print("Minutes:", mins)
    print("Hours:  ", hours)
    
def countdown_timer():
    print ("Timer has started")
    time_start = datetime.now()
    print(time_start)
    secs,mins,hours = time_config_input()
    total_secs = hours * 3600 + mins * 60 + secs
    
    while total_secs > 0:
        timer = timedelta(seconds = total_secs)
        print(timer, end="\r")
        sleep(1)
        total_secs -= 1
        
    print("Bzzzt! Countdown is finished!")
        
def stopwatch():
    print ("Stopwatch has started")
    time_start = datetime.now()
    print(time_start)
    value = ""
    
    while value.lower() != "s":
        value = input()
        totaltime = datetime.now() - time_start
        print("Time elapsed: "+str(totaltime), end="\r")
        
    print("Stopwatch stopped")
        
def main():
    #countdown_timer()
    stopwatch()
    
if __name__ == "__main__":
    main()
    
    
# UNUSED CODE
# def countdown_timer():   
#     print ("Timer is started")
#     time_start = datetime.now()
#     print(time_start)
#     secs,mins,hours = time_config_input()
#     time_config_display(secs,mins,hours)
#     
#     diff = datetime.now() - time_start
#     while((diff.seconds < secs + 1) and (diff.minutes < mins)):
#         if(diff.milliseconds == 0):
#            print(diff.seconds)
#         diff = datetime.now() - time_start

#  This line sets a variable log_file and assigns it the value of the um-server-01.text file using the open method in python.
log_file = open("um-server-01.txt")

# Creating a function called sales_reports and setting it to take in one paramater
def sales_reports(log_file):
    # Creates a for-loop that will loop through each item/line in the log_file array.
    for line in log_file:
        # For each item in the array this will remove the trailing spaces
        line = line.rstrip()
        # It will set the variable day to a string of whatever the first 3 letters of the line string are
        day = line[0:3]
        #  Check to see if the day variable is equal to "Tue"
        if day == "Mon":
            # If the variable day is equal to "Tue" print the whole line
            print(line)

# Call the function sales_reports and pass in the log_file variable as an argument
sales_reports(log_file)

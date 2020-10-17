### My project

For my project, I will analyze birth records from the year 1991 for the state of Kansas.

To analyze the data, you will need to follow the list of commands in the Makefile.

### Execute the analysis

The raw birth record data is located in the project folder (`birth.Rdata`).

`make install` will download the required packages to run the analysis.

`make clean.txt` will clean the raw data for the analysis.

`make fig1.png` will create the scatterplot of birthweight by maternal age.

`make report.html` will compile the report as a file called `report.html` in your directory that contains the result.

`make clean` will remove the cleaned data file, figure, and report from your directory.

`make help` reiterates the information above.

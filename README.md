### My project

For my project, I will analyze birth records from the year 1991 for the state of Kansas.

This directory includes the following folders:

`data`, which contains the raw birth record data (`birth.Rdata`). This folder is also where the cleaned data set will save.
`R`, which contains all of the R scripts.
`figs`, which will contain the scatterplot.
`output`, which will contain the final report.

### Execute the analysis

To analyze the data, you will need to pull the docker image using the following command:

`docker pull rsyoo/info550`

To retrieve the final report, you will need to mount your local directory using the following command:

`docker run -v /path/to/info550:/project/output -it info550`

    clear all
    file=fopen('nmea1.txt');
    formatSpec='%s';
    dollar=char(36);
    n='\n';
    sizeA=[1,10];
    %%$GPGSV,3,1,10,29,81,004,44.6,25,56,122,34.7,31,49,267,43.5,21,30,198,30.9*7B
tic
    A = importfile('nmea1.txt',"$GPGSV");
    toc
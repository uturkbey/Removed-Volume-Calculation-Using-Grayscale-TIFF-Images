%      This program is mainly focused on calculating the volume of the removed material from a
%   metal sheet due to Laser Beam exposure. All calculations are based on the height info 
%   recorded as a grayscale file in TIF/TIFF format. Data of these files are
%   expected to be the output of the measurements made by a digital microscope   

%--------------------------------------------------------------------------
%   SUMMARY

%       In order to accomplish the task, this program:

%       1)INPUT: Prompts user for a filename, pyhsical size of a bit and 4 seperate points. 
%   Filename is to access the file including height data. Size is for volume calculations 
%   and these points define the quadrilateral border(as being corners) 
%   of material removal site.

%       2)PROCESS 1: Discards the all ramining region beyond border. Line equations and
%   matrix manipulations are done.

%       3)PROCESS 2: Again based on the 4 points, an approximate surface is defined
%   based on linear approximations. The difference between the
%   approximate surface and the actual surface. Volume above and below the approximate 
%   surface are calculated seperately. Approximate area and length of the
%   region are calculated seperately

%       4)OUTPUT: Prints the "below volume", "above volume", "net volume
%   change", "length of the region", "approximate area of the region",
%   3-D shape of selected region and approximate surface 

%--------------------------------------------------------------------------
clear all; close all; clc;
%   1)INPUT
[data, bitSize, x0, y0, x1, y1, x2, y2, x3, y3] = readData(); 

%   2)PROCESS 1
data = discard(data, x0, y0, x1, y1, x2, y2, x3, y3);

%   3)PROCESS 2
approximateHeights = approximate(data, x0, y0, x1, y1, x2, y2, x3, y3);
[aboveV, belowV, netV] = calcVolumes(data, approximateHeights, bitSize);
%Approximate length
length = max(abs(y3-y0),abs(x1-x0)); %in units of pixels
length = length * bitSize / 1e3; %in units of mm
%Approximate area
area = polyarea([x0;x1;x2;x3;x0],[y0;y1;y2;y3;y0]); %in units of pixels
area = area * bitSize * bitSize /1e6;

%   4)OUTPUT
dispResults(data, approximateHeights, aboveV, belowV, netV, length, area);



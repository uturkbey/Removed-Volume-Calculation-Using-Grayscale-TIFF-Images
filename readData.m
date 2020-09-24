function [data, bitSize, x0, y0, x1, y1, x2, y2, x3, y3] = readData()
%readData function prompts user necessary titles and requests for 4 2-D
%points, a filename and Physical size of bits in units of Mm. Then parses height info from the specified grayscale image saved as TIF(tagged
%image format) file. Each pixel value in grayscale image corresponds to a height
%value

%Prompts a dialog box and related fields, ask for point coordinates and
%filename

prompt = {'Enter TIF filename:','Physical bitsize: ','X0','Y0','X1','Y1','X2','Y2','X3','Y3'};
dlgtitle = "Filename & Discard Coordinates";
dims = [1 35];
definput = {'FileName.tif','0.246443','0','0','2048','0','2048','1536','0','1536'};
answer = inputdlg(prompt,dlgtitle,dims,definput);

%Assigning coordinates of points to return variables
bitSize = str2double(answer{2});
x0 = str2num(answer{3});
y0 = str2num(answer{4});
x1 = str2num(answer{5});
y1 = str2num(answer{6});
x2 = str2num(answer{7});
y2 = str2num(answer{8});
x3 = str2num(answer{9});
y3 = str2num(answer{10});

%Reading height info from TIF file and recording it as a matrix into a return variable.  
t = Tiff(answer{1},'r');
data = read(t);

end


function [] = dispResults(data, approximateHeights, aboveV, belowV, netV, length, area)
%dispResults function displays all the volum results as texts and data points as 3-D graphs 

%Plotting orginal and approximate surfaces
mesh(data);
hold on;
surf(approximateHeights);
colorbar(); %adding colorbar
legend("Original Surface", "Approx. Surface"); %adding related titles to legend

a = gca; % get the current axis;
% set the width of the axis (the third value in Position) 
% to be 50% of the Figure's width
a.Position(3) = 0.5;
% put the textbox and related data at 75% of the width and 
% 10%, %20, %30 of the height of the figure
annotation('textbox', [0.75, 0.5, 0.1, 0.1], 'String', "Length of the region(mm): " + length );
annotation('textbox', [0.75, 0.4, 0.1, 0.1], 'String', "Are of the region(mm^2): " + area );
annotation('textbox', [0.75, 0.3, 0.1, 0.1], 'String', "Quality Factor: " + (1 - aboveV/belowV));
annotation('textbox', [0.75, 0.2, 0.1, 0.1], 'String', "Ablated Volume(mm^3): " + belowV );
annotation('textbox', [0.75, 0.1, 0.1, 0.1], 'String', "Burr Volume(mm^3):  " + aboveV );

end


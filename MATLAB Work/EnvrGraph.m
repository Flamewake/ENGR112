% Attempting to make a map of the Route we took with Accel Sensor.
% Ideally using integrals
clc,clear
accels_data = readmatrix('accel.txt');
x1 = accels_data(:,1);
y1 = accels_data(:,2);
z1 = accels_data(:,3);
% First step: Converting data to more usable unit. Data is in gs, need it in m/s^2
conversion_factor = 9.80665;

x1c = conversion_factor * (x1-.1);
y1c = conversion_factor * (y1-.29);
z1c = conversion_factor * z1;

% Looking at the data after this, there is an obvious large error in the sensor shown. 
% The x axis seems to be reading at about 0.105 g or 1 m/s acceleration while sitting still
% The y axis seems to be about 0.03 g or 0.3 m/s while sitting still
% The z axis seems to be about +/- 0.003 g above 1 g which is where it should be reading while not moving

% Defining Vars for integration
Vinit = 0;
delTime = 0.02;  % Taken from AccelCSV code used to record data, polling rate is 20 ms or 50 hz

% Integrating using for Velocity
Ux = x1c(1,:) * delTime;  % Setting the first velocity value
Vx1 = x1c;  % Making Vx1 a list with the same length of x1c
for i=1
    Vx1(i) = Ux(i);
end
% Making the first value in the list Vx1 into Ux. Not elegant but I dont have another solution

for i=2:7716
    Vx1(i) = Vx1(i-1) + x1c(i) * delTime;
end
% Setting the rest of the values in Vx1 into the actual acceleration values. Vf = Vinit + Accel*Time delta

% Vx1 = Vinit + x1c * delTime;
% Vy1 = Vinit + y1c * delTime;      These arent right lol
% Vz1 = Vinit + z1c * delTime;

% Displacement: V=meters/second, so multiplying the Velocity by time delta gives the distance travelled
Dx1 = Vx1 * delTime;
%Dy1 = Vy1 * delTime;
%Dz1 = Vz1 * delTime;

% Position: Displacement = Dfinal - Dinitial. Im fairly certain theres error here.
Px1 = Dx1;
for i=2:7716
    Px1(i) = Dx1(i) + Px1(i-1);
end

%Py1 = Dy1;
%for i=2:7716
%    Py1(i) = Py1(i-1) + Dy1(i);
%end

%% Ploting Stuff
% plot3(x1,y1,z1)
% plot3(Vx1,Vy1,Vz1)
% plot3(Dx1,Dy1,Dz1)
plot(1:7716,Px1)
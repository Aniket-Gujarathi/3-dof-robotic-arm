% taking angles for forward kinematics
fprintf('enter angles \n');
theta1 = input('');
theta2 = input('');
theta3 = input('');
% plotting initial position of arms
X = [0 1 2 3];
Y = [0 0 0 0];
l = line (X, Y);
axis ([-5 5 -5 5]);
%converting angles to radians
theta1 = theta1*(pi/180);
theta2 = theta2*(pi/180);
theta3 = theta3*(pi/180);
theta = theta1*theta2*theta3;
%condition for negative angles
if theta < 0
    theta = -theta;
end
% rotation matrix
for i = 0 : 0.01 : theta
    R1 = rot((i .* theta1) ./ (theta));
    R2 = rot((i .* theta2) ./ (theta));
    R3 = rot((i .* theta3) ./ (theta));
    % translation matrix
    t = dist(1);
    % transformation matrix
    T1 = R1 * t;
    T2 = R1 * t * R2 * t;
    T3 = R1 * t * R2 * t * R3 * t;
    % new co-ordinates of 2nd point after transformation
    Y1 = T1 * [0; 0; 0 ;1];
    disp(Y1);
    % new co-ordinates of 3rd point
    Y2 = T2 * [0; 0; 0; 1]; 
    disp(Y2);
    % new co-ordinates of 4th point
    Y3 = T3 * [0; 0; 0; 1];
    disp(Y3);
    % plotting final line
    X(2) = Y1(1);
    Y(2) = Y1(2);
    X(3) = Y2(1);
    Y(3) = Y2(2);
    X(4) = Y3(1);
    Y(4) = Y3(2);
    delete(l);
    l = line(X, Y);
    axis([-5, 5, -5, 5]);
    pause(0.1);
end
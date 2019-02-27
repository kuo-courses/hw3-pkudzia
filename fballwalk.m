function xdot = fballwalk(t, x)

% State derivative code generated by Dynamics Workbench Sat 2 Feb 2019 00:22:24
% Define constants

% Define forces: 

% State assignments
q1 = x(1); q2 = x(2); q3 = x(3); 
u1 = x(4); u2 = x(5); u3 = x(6); 

s1 = sin(q1); s2 = sin(q2); s3 = sin(q3); c1m2 = cos(q1 - q2); c1m3 = cos(q1 - q3); c2m3 = cos(q2 - q3); s1m2 = sin(q1 - q2); s1m3 = sin(q1 - q3); s2m3 = sin(q2 - q3); 

% Mass Matrix
MM = zeros(3,3);
MM(1,1) = I1 + M2*(l1*l1) + M3*(l1*l1) + M1*(lc1*lc1); MM(1,2) = ...
-(c1m2*l1*lc2*M2) - c1m2*l1*l2*M3; MM(1,3) = -(c1m3*l1*lc3*M3); 
MM(2,1) = MM(1,2); MM(2,2) = I2 + M3*(l2*l2) + M2*(lc2*lc2); MM(2,3) = ...
c2m3*l2*lc3*M3; 
MM(3,1) = MM(1,3); MM(3,2) = MM(2,3); MM(3,3) = I3 + M3*(lc3*lc3); 

% righthand side terms
rhs = zeros(3,1);
rhs(1) = s1*g*lc1*M1 + s1*g*l1*M2 + s1*g*l1*M3 + s1m2*(l1*lc2*M2 + l1*lc2*M3 ...
- l1*(-l2 + lc2)*M3)*(u2*u2) + s1m3*l1*lc3*M3*(u3*u3); 
rhs(2) = -(s2*g*lc2*M2) - s2*g*l2*M3 + s1m2*(-(lc1*lc2*M2) + (-l1 + ...
lc1)*lc2*M2 - l2*(l1 - lc1)*M3 - l2*lc1*M3)*(u1*u1) - s2m3*l2*lc3*M3*(u3*u3); 
rhs(3) = -(s3*g*lc3*M3) + s1m3*(-(lc1*lc3*M3) + (-l1 + lc1)*lc3*M3)*(u1*u1) + ...
s2m3*((l2 - lc2)*lc3*M3 + lc2*lc3*M3)*(u2*u2); 

udot = MM\rhs;
xdot = [x(3+1:2*3); udot];

kineticEnergy = (I1*(u1*u1))/2. + (I2*(u2*u2))/2. + (I3*(u3*u3))/2. + ...
(M1*(u1*u1)*(lc1*lc1))/2. + (M2*(2*c1m2*u2*(-(u1*(l1 - lc1)) - u1*lc1)*lc2 + ...
(-(u1*(l1 - lc1)) - u1*lc1)*(-(u1*(l1 - lc1)) - u1*lc1) + ...
u2*u2*(lc2*lc2)))/2. + (M3*(2*c1m2*(-(u1*(l1 - lc1)) - u1*lc1)*(u2*lc2 - ...
u2*(-l2 + lc2)) + 2*c1m3*u3*(-(u1*(l1 - lc1)) - u1*lc1)*lc3 + ...
2*c2m3*u3*(u2*lc2 - u2*(-l2 + lc2))*lc3 + (-(u1*(l1 - lc1)) - ...
u1*lc1)*(-(u1*(l1 - lc1)) - u1*lc1) + (u2*lc2 - u2*(-l2 + lc2))*(u2*lc2 - ...
u2*(-l2 + lc2)) + u3*u3*(lc3*lc3)))/2.;

gravPotentialEnergy = g*lc1*M1*cos(q1) - M2*(-(g*l1*cos(q1)) + g*lc2*cos(q2)) ...
- M3*(-(g*l1*cos(q1)) + g*l2*cos(q2) + g*lc3*cos(q3));

end % function

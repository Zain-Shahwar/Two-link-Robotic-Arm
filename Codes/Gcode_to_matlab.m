clc
G0 =[ 160.12 13.96]/1000 
G1 =[138.22 13.96]/1000 
G2 =[138.22 153.50]/1000
G3 =[133.96 149.72]/1000
G4 =[94.43 127.10]/1000 
G5 =[94.43 148.26]/1000 
G6 =[146.01 193.03]/1000
G7 =[160.12 193.03]/1000
G8 =[160.12 13.96]/1000 
% G5 =[94.43 148.26]/1000 



% Two Link Robotic Arm
% DH (Denavit–Hartenberg) Table
%           theta   d      a       alpha    R/P   offset

L(1) = Link([0      0      0.20       0      0      0]);
L(2) = Link([0      0      0.15       0      0      0]);
% Build a serial robot object
R2 = SerialLink(L(1:2), 'name', 'RR');

% Robot base coordinates (cartesian space)
R2.base=transl(0,0,0);

hold on
view(-0.6,0.8);
xlim([-0.6,1]);
ylim([-0.6,1]); 
zlim([-0.1,0.2]); 

%Set number of poitts from 1 point to another
po = 20;

% Desired points in cartesian space (meters)
% % ##########Plotting ZAIN#############

%Point 1 to 2 
pp0 = transl(G0(1,1),G0(1,2),0);
pp1 = transl(G1(1,1),G1(1,2),0);
crt_sp0 = ctraj(pp0,pp1,po);
crt_ik0  = R2.ikine(crt_sp0,'mask',[1 1 0 0 0 0]);


pp2 = transl(G2(1,1),G2(1,2),0);
crt_sp1 = ctraj(pp1,pp2,po);
crt_ik1  = R2.ikine(crt_sp1,'mask',[1 1 0 0 0 0]);

% %Point 2 to 3
pp3 = transl(G3(1,1),G3(1,2),0);
crt_sp2 = ctraj(pp2,pp3,po);
crt_ik2  = R2.ikine(crt_sp2,'mask',[1 1 0 0 0 0]);
% 
% %Point 3 to 4
pp4 = transl(G4(1,1),G4(1,2),0);
crt_sp3 = ctraj(pp3,pp4,po);
crt_ik3  = R2.ikine(crt_sp3,'mask',[1 1 0 0 0 0]);

% Point 4 to 5
pp5 = transl(G5(1,1),G5(1,2),0);
crt_sp4 = ctraj(pp4,pp5,po);
crt_ik4  = R2.ikine(crt_sp4,'mask',[1 1 0 0 0 0]);

% Point 5 to 6
pp6 = transl(G6(1,1),G6(1,2),0);
crt_sp5 = ctraj(pp5,pp6,po);
crt_ik5  = R2.ikine(crt_sp5,'mask',[1 1 0 0 0 0]);
% 
% % Point 6 to 7
pp7 = transl(G7(1,1),G7(1,2),0);
crt_sp6 = ctraj(pp6,pp7,po);
crt_ik6  = R2.ikine(crt_sp6,'mask',[1 1 0 0 0 0]);
% 
% Point 7 to 8
pp8 = transl(G8(1,1),G8(1,2),0);
crt_sp7 = ctraj(pp7,pp8,po);
crt_ik7  = R2.ikine(crt_sp7,'mask',[1 1 0 0 0 0]);

%Perform Simulation and plot all the points
for i=1:1:po
    fd0=R2.fkine(crt_ik0(i,:));
     j = transpose(fd0.t);
    plot2(j,'r.')    ;
     R2.plot(crt_ik0(i,:)) ;
end
for i=1:1:po
    fd1=R2.fkine(crt_ik1(i,:));
     j = transpose(fd1.t);
    plot2(j,'r.')    ;
     R2.plot(crt_ik1(i,:)) ;
end
for i=1:1:po
    fd2=R2.fkine(crt_ik2(i,:));
     j = transpose(fd2.t);
    plot2(j,'r.')    ;
     R2.plot(crt_ik2(i,:)) ;
end
for i=1:1:po
    fd3=R2.fkine(crt_ik3(i,:));
     j = transpose(fd3.t);
    plot2(j,'r.')    ;
     R2.plot(crt_ik3(i,:)) ;
end
% 
for i=1:1:po
    fd4=R2.fkine(crt_ik4(i,:));
     j = transpose(fd4.t);
    plot2(j,'r.');
     R2.plot(crt_ik4(i,:)) ;
end

for i=1:1:po
    fd5=R2.fkine(crt_ik5(i,:));
     j = transpose(fd5.t);
    plot2(j,'r.');
     R2.plot(crt_ik5(i,:)) ;
end
% % 
for i=1:1:po
    fd6=R2.fkine(crt_ik6(i,:));
     j = transpose(fd6.t);
     R2.plot(crt_ik6(i,:));
end
% % 
for i=1:1:po
    fd7=R2.fkine(crt_ik7(i,:));
     j = transpose(fd7.t);
    plot2(j,'r.')    ;
     R2.plot(crt_ik7(i,:)) ;
end


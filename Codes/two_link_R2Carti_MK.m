clc
% Two Link Robotic Arm
% DH (Denavit–Hartenberg) Table
%           theta   d      a       alpha    R/P   offset

L(1) = Link([0      0      0.20       0      0      0]);
L(2) = Link([0      0      0.15       0      0      0]);
% Build a serial robot object
R2 = SerialLink(L(1:2), 'name', 'RR');

% Robot base coordinates (cartesian space)
R2.base=transl(0,0,0);

% Desired points in cartesian space (meters)    
hold on
view(-0.6,0.8);
xlim([-0.6,1]);
ylim([-0.6,1]); 
zlim([-0.1,0.2]); 
po = 25;

% % ####################Plotting MK###############

%Point 1 to 2 
pp1 = transl(-0.2,0.1,0);
pp2 = transl(-0.2,0.2,0);
crt_sp1 = ctraj(pp1,pp2,po);
crt_ik1  = R2.ikine(crt_sp1,'mask',[1 1 0 0 0 0]);

%Point 2 to 3
pp3 = transl(-0.1,0.1,0);
crt_sp2 = ctraj(pp2,pp3,po);
crt_ik2  = R2.ikine(crt_sp2,'mask',[1 1 0 0 0 0]);

%Point 3 to 4
pp4 = transl(0,0.2,0);
crt_sp3 = ctraj(pp3,pp4,po);
crt_ik3  = R2.ikine(crt_sp3,'mask',[1 1 0 0 0 0]);

% Point 4 to 5
pp5 = transl(0,0.1,0);
crt_sp4 = ctraj(pp4,pp5,po);
crt_ik4  = R2.ikine(crt_sp4,'mask',[1 1 0 0 0 0]);

% Point 5 to 6
pp5 = transl(0,0.1,0);
pp6 = transl(0.1,0.1,0);
crt_sp5 = ctraj(pp5,pp6,po);
crt_ik5  = R2.ikine(crt_sp5,'mask',[1 1 0 0 0 0]);

% Point 6 to 7
pp7 = transl(0.1,0.2,0);
crt_sp6 = ctraj(pp6,pp7,po);
crt_ik6  = R2.ikine(crt_sp6,'mask',[1 1 0 0 0 0]);

% Point 7 to 8
pp8 = transl(0.2,0.2,0);
crt_sp7 = ctraj(pp7,pp8,po);
crt_ik7  = R2.ikine(crt_sp7,'mask',[1 1 0 0 0 0]);

% Point 8 to 9
pp9 = transl(0.1,0.15,0);
crt_sp8 = ctraj(pp8,pp9,po);
crt_ik8  = R2.ikine(crt_sp8,'mask',[1 1 0 0 0 0]);

% Point 9 to 10
pp10 = transl(0.2,0.1,0);
crt_sp9 = ctraj(pp9,pp10,po);
crt_ik9  = R2.ikine(crt_sp9,'mask',[1 1 0 0 0 0]);

% Point 10 to 11
% pp11 = transl(0.13,0.1,0);
% crt_sp10 = ctraj(pp10,pp11,po);
% crt_ik10  = R2.ikine(crt_sp10,'mask',[1 1 0 0 0 0]);
% 
% % Point 11 to 12
% pp12 = transl(0.13,0.2,0);
% crt_sp11 = ctraj(pp11,pp12,po);
% crt_ik11  = R2.ikine(crt_sp11,'mask',[1 1 0 0 0 0]);
% 
% % Point 12 to 13
% pp13 = transl(0.2,0.1,0);
% crt_sp12 = ctraj(pp12,pp13,po);
% crt_ik12  = R2.ikine(crt_sp12,'mask',[1 1 0 0 0 0]);
% 
% % Point 13 to 14
% pp14 = transl(0.2,0.2,0);
% crt_sp13 = ctraj(pp13,pp14,po);
% crt_ik13  = R2.ikine(crt_sp13,'mask',[1 1 0 0 0 0]);

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

for i=1:1:po
    fd4=R2.fkine(crt_ik4(i,:));
     j = transpose(fd4.t);
    plot2(j,'r.');
     R2.plot(crt_ik4(i,:)) ;
end

for i=1:1:po
    fd5=R2.fkine(crt_ik5(i,:));
     j = transpose(fd5.t);
%     plot2(j,'r.');
     R2.plot(crt_ik5(i,:)) ;
end
% 
for i=1:1:po
    fd6=R2.fkine(crt_ik6(i,:));
     j = transpose(fd6.t);
     plot2(j,'r.');
     R2.plot(crt_ik6(i,:));
end

for i=1:1:po
    fd7=R2.fkine(crt_ik7(i,:));
     j = transpose(fd7.t);
%     plot2(j,'r.')    ;
     R2.plot(crt_ik7(i,:)) ;
end

for i=1:1:po
    fd8=R2.fkine(crt_ik8(i,:));
     j = transpose(fd8.t);
     plot2(j,'r.')    ;
     R2.plot(crt_ik8(i,:)) ;
end

for i=1:1:po
    fd9=R2.fkine(crt_ik9(i,:));
    j = transpose(fd9.t);
    plot2(j,'r.')    ;
    R2.plot(crt_ik9(i,:)) ;
end

% for i=1:1:po
%     fd10=R2.fkine(crt_ik10(i,:));
%      j = transpose(fd10.t);
% %     k(i,:)= j;
%     plot2(j,'r.');
%      R2.plot(crt_ik10(i,:)) ;
% end
% 
% for i=1:1:po
%     fd11=R2.fkine(crt_ik11(i,:));
%      j = transpose(fd11.t);
% %     k(i,:)= j;
%     plot2(j,'r.');
%      R2.plot(crt_ik11(i,:)) ;
% end
% for i=1:1:po
%     fd12=R2.fkine(crt_ik12(i,:));
%      j = transpose(fd12.t);
% %     k(i,:)= j;
%     plot2(j,'r.');
%      R2.plot(crt_ik12(i,:)) ;
% end
% 
% for i=1:1:po
%     fd13=R2.fkine(crt_ik13(i,:));
%      j = transpose(fd13.t);
% %     k(i,:)= j;
%     plot2(j,'r.');
%      R2.plot(crt_ik13(i,:)) ;
% end

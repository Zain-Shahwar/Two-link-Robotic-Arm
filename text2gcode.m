%Typo created by Adrien Rosselet

%put your mill just touching the surface manually
%set the gcode sender to X0 Y0 Z0
%run the code

%parametres (in mm)
text='ZAIN';
lengthLet=4;%minimum half of hightLet
hightLet=6;%letter hight
space=2;%space between letters
depth=-0.3;%engraving depth
up=1;%hight when the tool is mooving
fileID = fopen('gcode.gcode','w');%enter the name of the created file
fprintf(fileID,'%s\n','G21 G90 G17 F90');%Check this header line. Is it ok for your machine?

%program
down=depth;
posAct=0;%X value of actual position
fprintf(fileID,'%s\n','G01 X0 Y0 Z1');%I prefer to make the first move slowly in case...
rapide='G0';
lent='G01';
tourHoraire='G02';
tourAntihoraire='G03';
total_lenght=length(text)*lengthLet
for i=1:length(text)
    switch text(i)
        case 'A'
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct,'Y',0,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct,'Y',0,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet/2,'Y',hightLet,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet,'Y',0,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct+lengthLet,'Y',0,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct+lengthLet/4,'Y',hightLet/2,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet/4,'Y',hightLet/2,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet*3/4,'Y',hightLet/2,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct+lengthLet*3/4,'Y',hightLet/2,'Z',up);
            posAct=posAct+lengthLet;
        case 'B'
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct,'Y',0,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct,'Y',0,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct,'Y',hightLet,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet-hightLet/4,'Y',hightLet,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f %c%.3f\n',tourHoraire,'X',posAct+lengthLet-hightLet/4,'Y',hightLet/2,'I',0,'J',-hightLet/4);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct,'Y',hightLet/2,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet-hightLet/4,'Y',hightLet/2,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f %c%.3f\n',tourHoraire,'X',posAct+lengthLet-hightLet/4,'Y',0,'I',0,'J',-hightLet/4);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct,'Y',0,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct,'Y',0,'Z',up);
            posAct=posAct+lengthLet;
        case 'C'
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct+lengthLet,'Y',hightLet*3/4,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet,'Y',hightLet*3/4,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f %c%.3f\n',tourAntihoraire,'X',posAct+lengthLet-hightLet/4,'Y',hightLet,'I',-hightLet/4,'J',0);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+hightLet/4,'Y',hightLet,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f %c%.3f\n',tourAntihoraire,'X',posAct,'Y',hightLet*3/4,'I',0,'J',-hightLet/4);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct,'Y',hightLet/4,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f %c%.3f\n',tourAntihoraire,'X',posAct+hightLet/4,'Y',0,'I',hightLet/4,'J',0);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet-hightLet/4,'Y',0,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f %c%.3f\n',tourAntihoraire,'X',posAct+lengthLet,'Y',hightLet/4,'I',0,'J',hightLet/4);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct+lengthLet,'Y',hightLet/4,'Z',up);
            posAct=posAct+lengthLet;
        case 'D'
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct,'Y',0,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct,'Y',0,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct,'Y',hightLet,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet-hightLet/2,'Y',hightLet,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f %c%.3f\n',tourHoraire,'X',posAct+lengthLet-hightLet/2,'Y',0,'I',0,'J',-hightLet/2);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct,'Y',0,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct,'Y',0,'Z',up);
            posAct=posAct+lengthLet;
        case 'E'
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct,'Y',0,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct,'Y',0,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct,'Y',hightLet,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet,'Y',hightLet,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct+lengthLet,'Y',hightLet,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct,'Y',hightLet/2,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct,'Y',hightLet/2,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet,'Y',hightLet/2,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct+lengthLet,'Y',hightLet/2,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct,'Y',0,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct,'Y',0,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet,'Y',0,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct+lengthLet,'Y',0,'Z',up);
            posAct=posAct+lengthLet;
        case 'F'
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct,'Y',0,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct,'Y',0,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct,'Y',hightLet,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet,'Y',hightLet,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct+lengthLet,'Y',hightLet,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct,'Y',hightLet/2,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct,'Y',hightLet/2,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet,'Y',hightLet/2,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct+lengthLet,'Y',hightLet/2,'Z',up);
            posAct=posAct+lengthLet;
        case 'G'
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct+lengthLet,'Y',hightLet*3/4,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet,'Y',hightLet*3/4,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f %c%.3f\n',tourAntihoraire,'X',posAct+lengthLet-hightLet/4,'Y',hightLet,'I',-hightLet/4,'J',0);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+hightLet/4,'Y',hightLet,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f %c%.3f\n',tourAntihoraire,'X',posAct,'Y',hightLet*3/4,'I',0,'J',-hightLet/4);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct,'Y',hightLet/4,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f %c%.3f\n',tourAntihoraire,'X',posAct+hightLet/4,'Y',0,'I',hightLet/4,'J',0);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet-hightLet/4,'Y',0,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f %c%.3f\n',tourAntihoraire,'X',posAct+lengthLet,'Y',hightLet/4,'I',0,'J',hightLet/4);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet,'Y',hightLet/2,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet/2,'Y',hightLet/2,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct+lengthLet/2,'Y',hightLet/2,'Z',up);
            posAct=posAct+lengthLet;
        case 'H'
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct,'Y',0,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct,'Y',0,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct,'Y',hightLet,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct,'Y',hightLet,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct+lengthLet,'Y',0,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet,'Y',0,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet,'Y',hightLet,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct+lengthLet,'Y',hightLet,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct,'Y',hightLet/2,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct,'Y',hightLet/2,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet,'Y',hightLet/2,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct+lengthLet,'Y',hightLet/2,'Z',up);
            posAct=posAct+lengthLet;
        case 'I'
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct+lengthLet/4,'Y',0,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet/4,'Y',0,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet/4,'Y',hightLet,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct+lengthLet/4,'Y',hightLet,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct,'Y',hightLet,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct,'Y',hightLet,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet/2,'Y',hightLet,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct+lengthLet/2,'Y',hightLet,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct,'Y',0,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct,'Y',0,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet/2,'Y',0,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct+lengthLet/2,'Y',0,'Z',up);
            posAct=posAct+lengthLet/2;
        case 'J'
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct,'Y',hightLet/4,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct,'Y',hightLet/4,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f %c%.3f\n',tourAntihoraire,'X',posAct+hightLet/4,'Y',0,'I',+hightLet/4,'J',0);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet-hightLet/4,'Y',0,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f %c%.3f\n',tourAntihoraire,'X',posAct+lengthLet,'Y',hightLet/4,'I',0,'J',+hightLet/4);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet,'Y',hightLet,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct,'Y',hightLet,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct,'Y',hightLet,'Z',up);
            posAct=posAct+lengthLet;
        case 'K'
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct,'Y',0,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct,'Y',0,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct,'Y',hightLet,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct,'Y',hightLet,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct,'Y',hightLet/2,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct,'Y',hightLet/2,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet,'Y',hightLet,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct+lengthLet,'Y',hightLet,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct,'Y',hightLet/2,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct,'Y',hightLet/2,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet,'Y',0,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct+lengthLet,'Y',0,'Z',up);
            posAct=posAct+lengthLet;
        case 'L'
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct,'Y',0,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct,'Y',0,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct,'Y',hightLet,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct,'Y',hightLet,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct,'Y',0,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct,'Y',0,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet,'Y',0,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct+lengthLet,'Y',0,'Z',up);
            posAct=posAct+lengthLet;
        case 'M'
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct,'Y',0,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct,'Y',0,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct,'Y',hightLet,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet/2,'Y',hightLet/2,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet,'Y',hightLet,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet,'Y',0,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct+lengthLet,'Y',0,'Z',up);
            posAct=posAct+lengthLet;
        case 'N'
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct,'Y',0,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct,'Y',0,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct,'Y',hightLet,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet,'Y',0,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet,'Y',hightLet,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct+lengthLet,'Y',hightLet,'Z',up);
            posAct=posAct+lengthLet;
        case 'O'
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct+lengthLet,'Y',hightLet*3/4,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet,'Y',hightLet*3/4,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f %c%.3f\n',tourAntihoraire,'X',posAct+lengthLet-hightLet/4,'Y',hightLet,'I',-hightLet/4,'J',0);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+hightLet/4,'Y',hightLet,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f %c%.3f\n',tourAntihoraire,'X',posAct,'Y',hightLet*3/4,'I',0,'J',-hightLet/4);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct,'Y',hightLet/4,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f %c%.3f\n',tourAntihoraire,'X',posAct+hightLet/4,'Y',0,'I',hightLet/4,'J',0);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet-hightLet/4,'Y',0,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f %c%.3f\n',tourAntihoraire,'X',posAct+lengthLet,'Y',hightLet/4,'I',0,'J',hightLet/4);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet,'Y',hightLet*3/4,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct+lengthLet,'Y',hightLet*3/4,'Z',up);
            posAct=posAct+lengthLet;
        case 'P'
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct,'Y',0,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct,'Y',0,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct,'Y',hightLet,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet-hightLet/4,'Y',hightLet,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f %c%.3f\n',tourHoraire,'X',posAct+lengthLet-hightLet/4,'Y',hightLet/2,'I',0,'J',-hightLet/4);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct,'Y',hightLet/2,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct,'Y',hightLet/2,'Z',up);
            posAct=posAct+lengthLet;
        case 'Q'
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct+lengthLet,'Y',hightLet*3/4,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet,'Y',hightLet*3/4,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f %c%.3f\n',tourAntihoraire,'X',posAct+lengthLet-hightLet/4,'Y',hightLet,'I',-hightLet/4,'J',0);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+hightLet/4,'Y',hightLet,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f %c%.3f\n',tourAntihoraire,'X',posAct,'Y',hightLet*3/4,'I',0,'J',-hightLet/4);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct,'Y',hightLet/4,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f %c%.3f\n',tourAntihoraire,'X',posAct+hightLet/4,'Y',0,'I',hightLet/4,'J',0);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet-hightLet/4,'Y',0,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f %c%.3f\n',tourAntihoraire,'X',posAct+lengthLet,'Y',hightLet/4,'I',0,'J',hightLet/4);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet,'Y',hightLet*3/4,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct+lengthLet,'Y',hightLet*3/4,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct+lengthLet/2,'Y',hightLet/2,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet/2,'Y',hightLet/2,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet,'Y',0,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct+lengthLet,'Y',0,'Z',up);
            posAct=posAct+lengthLet;
        case 'R'
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct,'Y',0,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct,'Y',0,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct,'Y',hightLet,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet-hightLet/4,'Y',hightLet,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f %c%.3f\n',tourHoraire,'X',posAct+lengthLet-hightLet/4,'Y',hightLet/2,'I',0,'J',-hightLet/4);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct,'Y',hightLet/2,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet,'Y',0,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct+lengthLet,'Y',0,'Z',up);
            posAct=posAct+lengthLet;
        case 'S'
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct+lengthLet,'Y',hightLet*3/4,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet,'Y',hightLet*3/4,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f %c%.3f\n',tourAntihoraire,'X',posAct+lengthLet-hightLet/4,'Y',hightLet,'I',-hightLet/4,'J',0);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+hightLet/4,'Y',hightLet,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f %c%.3f\n',tourAntihoraire,'X',posAct+hightLet/4,'Y',hightLet/2,'I',0,'J',-hightLet/4);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet-hightLet/4,'Y',hightLet/2,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f %c%.3f\n',tourHoraire,'X',posAct+lengthLet-hightLet/4,'Y',0,'I',0,'J',-hightLet/4);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+hightLet/4,'Y',0,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f %c%.3f\n',tourHoraire,'X',posAct,'Y',hightLet/4,'I',0,'J',hightLet/4);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct,'Y',hightLet/4,'Z',up);
            posAct=posAct+lengthLet;
        case 'T'
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct+lengthLet/2,'Y',0,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet/2,'Y',0,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet/2,'Y',hightLet,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct+lengthLet/2,'Y',hightLet,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct,'Y',hightLet,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct,'Y',hightLet,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet,'Y',hightLet,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct+lengthLet,'Y',hightLet,'Z',up);
            posAct=posAct+lengthLet;
        case 'U'
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct,'Y',hightLet,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct,'Y',hightLet,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct,'Y',hightLet/4,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f %c%.3f\n',tourAntihoraire,'X',posAct+hightLet/4,'Y',0,'I',hightLet/4,'J',0);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet-hightLet/4,'Y',0,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f %c%.3f\n',tourAntihoraire,'X',posAct+lengthLet,'Y',hightLet/4,'I',0,'J',hightLet/4);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet,'Y',hightLet,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct+lengthLet,'Y',hightLet,'Z',up);
            posAct=posAct+lengthLet;
        case 'V'
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct,'Y',hightLet,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct,'Y',hightLet,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet/2,'Y',0,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet,'Y',hightLet,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct+lengthLet,'Y',hightLet,'Z',up);
            posAct=posAct+lengthLet;
        case 'W'
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct,'Y',hightLet,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct,'Y',hightLet,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet/4,'Y',0,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet/2,'Y',hightLet,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet*3/4,'Y',0,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet,'Y',hightLet,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct+lengthLet,'Y',hightLet,'Z',up);
            posAct=posAct+lengthLet;
        case 'X'
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct,'Y',hightLet,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct,'Y',hightLet,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet,'Y',0,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct+lengthLet,'Y',0,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct,'Y',0,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct,'Y',0,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet,'Y',hightLet,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct+lengthLet,'Y',hightLet,'Z',up);
            posAct=posAct+lengthLet;
        case 'Y'
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct+lengthLet/2,'Y',0,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet/2,'Y',0,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet/2,'Y',hightLet/2,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct,'Y',hightLet,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct,'Y',hightLet,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct+lengthLet/2,'Y',hightLet/2,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet/2,'Y',hightLet/2,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet,'Y',hightLet,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct+lengthLet,'Y',hightLet,'Z',up);
            posAct=posAct+lengthLet;
        case 'Z'
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct+lengthLet,'Y',0,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet,'Y',0,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct,'Y',0,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct+lengthLet,'Y',hightLet,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct,'Y',hightLet,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct,'Y',hightLet,'Z',up);
            posAct=posAct+lengthLet;
        case '.'
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct,'Y',0,'Z',up);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',lent,'X',posAct,'Y',0,'Z',down);
            fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',posAct,'Y',0,'Z',up);
        case ' '
            posAct=posAct+lengthLet;
    end
    posAct=posAct+space;
end
fprintf(fileID,'%s %c%.3f %c%.3f %c%.3f\n',rapide,'X',0,'Y',0,'Z',up);
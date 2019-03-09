(Scribbled version of C:\Users\Zain\AppData\Local\Temp\ink_ext_XXXXXX.svgMLSLYZ @ 3500.00)
( unicorn.py --tab="plotter_setup" --pen-up-angle=50 --pen-down-angle=30 --start-delay=150 --stop-delay=150 --xy-feedrate=3500 --z-feedrate=161.10000610351562 --z-height=0 --finished-height=0 --register-pen=true --x-home=0 --y-home=0 --num-copies=1 --continuous=false --pause-on-layer-change=false C:\Users\Zain\AppData\Local\Temp\ink_ext_XXXXXX.svgMLSLYZ )
G21 (metric ftw)
G90 (absolute mode)
G92 X0.00 Y0.00 Z0.00 (you are here)

M300 S30 (pen down)
G4 P150 (wait 150ms)
M300 S50 (pen up)
G4 P150 (wait 150ms)
M18 (disengage drives)
M01 (Was registration test successful?)
M17 (engage drives if YES, and continue)

(Polyline consisting of 1 segments.)
G1 X-193.54 Y170.27 F3500.00
M300 S30.00 (pen down)
G4 P150 (wait 150ms)
G1 X-90.63 Y170.27 F3500.00
G1 X-180.56 Y62.88 F3500.00
G1 X-76.72 Y65.99 F3500.00
G1 X-27.58 Y171.83 F3500.00
G1 X35.47 Y65.99 F3500.00
M300 S50.00 (pen up)
G4 P150 (wait 150ms)

(Polyline consisting of 1 segments.)
G1 X-47.98 Y123.58 F3500.00
M300 S30.00 (pen down)
G4 P150 (wait 150ms)
G1 X3.02 Y123.58 F3500.00
M300 S50.00 (pen up)
G4 P150 (wait 150ms)

(Polyline consisting of 1 segments.)
G1 X53.08 Y174.94 F3500.00
M300 S30.00 (pen down)
G4 P150 (wait 150ms)
G1 X56.79 Y67.55 F3500.00
G1 X77.19 Y67.55 F3500.00
G1 X75.33 Y173.39 F3500.00
G1 X165.27 Y69.10 F3500.00
G1 X162.49 Y174.94 F3500.00
M300 S50.00 (pen up)
G4 P150 (wait 150ms)


(end of print job)
M300 S50.00 (pen up)
G4 P150 (wait 150ms)
M300 S255 (turn off servo)
G1 X0 Y0 F3500.00
G1 Z0.00 F161.10 (go up to finished level)
G1 X0.00 Y0.00 F3500.00 (go home)
M18 (drives off)

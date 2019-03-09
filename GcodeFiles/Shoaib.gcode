(Scribbled version of C:\Users\Zain\AppData\Local\Temp\ink_ext_XXXXXX.svgUO3LYZ @ 3500.00)
( unicorn.py --tab="plotter_setup" --pen-up-angle=50 --pen-down-angle=30 --start-delay=150 --stop-delay=150 --xy-feedrate=3500 --z-feedrate=161.10000610351562 --z-height=0 --finished-height=0 --register-pen=true --x-home=0 --y-home=0 --num-copies=1 --continuous=false --pause-on-layer-change=false C:\Users\Zain\AppData\Local\Temp\ink_ext_XXXXXX.svgUO3LYZ )
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
G1 X-141.73 Y177.32 F3500.00
M300 S30.00 (pen down)
G4 P150 (wait 150ms)
G1 X-190.06 Y176.11 F3500.00
G1 X-191.09 Y128.89 F3500.00
G1 X-142.75 Y131.31 F3500.00
G1 X-145.84 Y92.57 F3500.00
G1 X-191.09 Y90.15 F3500.00
M300 S50.00 (pen up)
G4 P150 (wait 150ms)

(Polyline consisting of 1 segments.)
G1 X-122.19 Y92.57 F3500.00
M300 S30.00 (pen down)
G4 P150 (wait 150ms)
G1 X-120.13 Y179.74 F3500.00
G1 X-121.16 Y136.16 F3500.00
G1 X-75.91 Y136.16 F3500.00
G1 X-74.89 Y177.32 F3500.00
G1 X-76.94 Y90.15 F3500.00
M300 S50.00 (pen up)
G4 P150 (wait 150ms)

(Polyline consisting of 1 segments.)
G1 X-62.55 Y176.11 F3500.00
M300 S30.00 (pen down)
G4 P150 (wait 150ms)
G1 X-64.60 Y93.78 F3500.00
G1 X-0.85 Y97.42 F3500.00
G1 X1.21 Y179.74 F3500.00
G1 X-62.55 Y176.11 F3500.00
M300 S50.00 (pen up)
G4 P150 (wait 150ms)

(Polyline consisting of 1 segments.)
G1 X17.66 Y98.63 F3500.00
M300 S30.00 (pen down)
G4 P150 (wait 150ms)
G1 X54.68 Y182.16 F3500.00
G1 X95.81 Y104.68 F3500.00
M300 S50.00 (pen up)
G4 P150 (wait 150ms)

(Polyline consisting of 1 segments.)
G1 X38.23 Y144.63 F3500.00
M300 S30.00 (pen down)
G4 P150 (wait 150ms)
G1 X74.22 Y145.84 F3500.00
M300 S50.00 (pen up)
G4 P150 (wait 150ms)

(Polyline consisting of 1 segments.)
G1 X110.21 Y185.79 F3500.00
M300 S30.00 (pen down)
G4 P150 (wait 150ms)
G1 X110.21 Y104.68 F3500.00
M300 S50.00 (pen up)
G4 P150 (wait 150ms)

(Polyline consisting of 1 segments.)
G1 X141.06 Y104.68 F3500.00
M300 S30.00 (pen down)
G4 P150 (wait 150ms)
G1 X141.06 Y187.00 F3500.00
G1 X180.14 Y184.58 F3500.00
G1 X190.42 Y153.11 F3500.00
G1 X143.12 Y141.00 F3500.00
G1 X189.39 Y128.89 F3500.00
G1 X176.02 Y104.68 F3500.00
G1 X141.06 Y104.68 F3500.00
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

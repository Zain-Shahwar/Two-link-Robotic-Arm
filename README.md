# 2-link-Robotic-Arm
Design and Development of 2-link Robotic Arm in MATLAB® using Robotic Toolbox for MATLAB®

# INTRODUCTION:
This a hobby project which I have done in Matlab. The motivation behind this project is to learn more about robotics using MATLAB®.
The objective to learn and implement the basics of mathematics and physics behind the development of manipulator in an environment where I can easily simulate and visualize the position and orientaion of robotic arm. I started from the very basics and cover the following points given below:

1. Transformation and orientation of 2D and 3D planes. 
2. Perform Inverse and Forward Kinematics of serial robot and visualize the end effector pose in 3D graph.
3. Perform Inverse and Forward dynamics using Euler-Lagrangian or Newton Euler algorithm. 
4. Implementation of PID control in joint and Cartesian space to control each joint of a robot(position and orientation).
5. Trajactory planning to find the optimal solution to go from reference point to the goal point.

After completing all the above points, I will also show how to use G-code and M-code as an input and plot the given reference 2D shapes or images.

# LIBARARY:
I started to develop this 2-link planner robot using library "Robotics Toolbox for Matlab" from Peter Corke. 
Link: http://petercorke.com/wordpress/toolboxes/robotics-toolbox

The Toolbox have many useful fuctions for study, simulation and analysis of arm type Robots. It gives an easy way to perform the kinematics, dynamics and trajectory generation. We can also find the end effector's orientaton and pose in 2D and 3D as matrices. The Toolbox also provides functions for manipulating and converting between datatypes such as vectors, homogeneous transformations and unit-quaternions which are necessary to represent 3-dimensional position and orientation.

The Toolbox uses a very general method of representing the kinematics and dynamics of serial-link manipulators. We can also use CodeGenerator class which gives Simulink block objects and library blocks which easy be implemented in simulink for controller implementation. Number of examples are provided for well known robots from Kinova, Universal Robotics, Rethink as well as classical robots such as the Puma 560 and the Stanford arm.

![Two_link](https://user-images.githubusercontent.com/47333843/54077109-5fc80000-42b4-11e9-9a53-39da17e0e129.gif)

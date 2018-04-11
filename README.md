# User performance assessment - collected data

This repository contains data as well as parsing and preprocessing scripts for the data collected in the user performance study. We performed this user study in order to evaluate subject performance in daily tasks that require physical interactions with objects and manuevering tools in a dexterous way. 


| Dependencies  |
| ------------- |
| [my_matlab_rosbag](https://github.com/nbfigueroa/my_matlab_rosbag)|
| [DTW]()|




The task investigated in this experiment was an asymmetrical bimanual task: "fruit scooping". The experiment was initially performed with 52 subjects, out of which only 37 had valid sensor data. 

## Experimental Setup

For recording demonstrations we used the following setup (also shown in the images below):

- a 7 degrees of freedom (DoF) Kuka LWR robotic arm, and a Barret hand (4 DoF), were used for holding the mellon to be scooped. The demonstrator could kinesthetically guide the arm with his left hand. See Fig. 1.

- a data glove covered with Tekscan tactile sensors on the front and side of the phalanges (see Fig. 2) was used to record the motion of the active hand performing the scooping motion.

- the tool contained a 6-axis force-torque sensor and its motion was tracked with infrared markers (see Fig. 3).

- an Optitrack Vision System was used to track the motion of the tool, human wrist and external objects (i.e. the trashing bowl, see Fig. 4). External cameras recorded the subject's performance (see Fig. 5).

<img src="/images/overall_setup.jpg" width="32%"/>  <img src="/images/glove.JPG" width="32%"/>  <img src="/images/tool.JPG" width="32%"/>
<img src="/images/external_obj.JPG" width="32%"/>  <img src="/images/cameras.JPG" width="32%"/>  <img src="/images/robot.JPG" width="32%"/>

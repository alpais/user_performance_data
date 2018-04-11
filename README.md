# User performance assessment - collected data

This repository contains data as well as parsing and preprocessing scripts for the data collected in the user performance study. We performed this user study in order to evaluate subject performance in daily tasks that require physical interactions with objects and manuevering tools in a dexterous way. 


| Dependencies  |
| ------------- |
| [my_matlab_rosbag](https://github.com/nbfigueroa/my_matlab_rosbag)|
| [WarpingTB]()|




The task investigated in this experiment was an asymmetrical bimanual task: "fruit scooping". The experiment was initially performed with 52 subjects, out of which only 37 had valid sensor data. 

## Experimental Setup

For recording demonstrations we used the following setup (also shown in the images below):

- a 7 degrees of freedom (DoF) Kuka LWR robotic arm, and a Barret hand (4 DoF), were used for holding the mellon to be scooped. The demonstrator could kinesthetically guide the arm with his left hand. See Fig. 1.

- a data glove covered with Tekscan tactile sensors on the front and side of the phalanges (see Fig. 2) was used to record the motion of the active hand performing the scooping motion.

- the tool contained a 6-axis force-torque sensor and its motion was tracked with infrared markers (see Fig. 3).

- an Optitrack Vision System was used to track the motion of the tool, human wrist and external objects (i.e. the trashing bowl, see Fig. 4). External cameras recorded the subject's performance (see Fig. 5).

<img src="/images/overall_setup.jpg" width="32%"/>  <img src="/images/glove.JPG" width="32%"/>  <img src="/images/tool.JPG" width="32%"/>
<img src="/images/external_obj.JPG" width="32%"/>  <img src="/images/cameras.JPG" width="32%"/>  <img src="/images/robot.JPG" width="32%"/>


## Recorded data

In this experiment we collected the following data :
* sensor data, consisting of:
  * robot data
    * end effector position and orientation
    * forces acting on the robot's end effector
  * human hand data, consisting of:
    * position and orientation of the wrist
    * finger joint angles
    * tactile readings from the patches on the fornt and side of each phalange and palm
  * tool data, consisting of:
    * tool position ond orientation
     * forces and torques acting on the tool
  * external objects - full pose tracking
* post experiment questionnaire data (annonymised)
* video data - recordings of each demonstration performed by each subject
* video rating data - performed by external raters who have not done the experiment (only done for subjects with valid sensor data)
* external measurements - scooped quantity


## Data parsing and preprocessing

The scripts in this repository perform the following steps for data preparation:
 * ROS bag parsing 
 * smoothing
 * rescaling
 * dynamic time warping
 * data plotting and visualization

 > The initial ROS bag files are not provided due to the large size (total 39.6 GB). We provide the data obtained after the DTW.

 > Video recordings are not provided in order to protect the subjects' identity (total size 8.69 GB)

## Data analysis and stats

For the analysis of the data in this experiment and the generated statsitics see the following repository:
[user_performance_estimation](https://github.com/alpais/user_performance_estimation)

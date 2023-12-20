# lidar_segmentation

<!-- GETTING STARTED -->
## Demo

https://github.com/codeck313/lidar_segmentation/assets/23121752/f6e8b76e-93cb-4f3b-ae87-d55e223f781d

## Installation

1. Clone the repo.
   ```sh
   $ git clone https://github.com/codeck313/lidar_segmentation.git
   ```
### Using Docker
1. Build the docker image using the dockerfile in the repo. 
   ```sh
   $ docker build .
   ```
   
2. Using Docker-run composer start the docker container and attach the repository folder as a volume to it.
	 ```sh
   $ docker-run --verbose --volume /path/to/the/cloned/repo:rw --network host ros:noetic-full
   ```
3. [optional] Install kitt2bag to convert the kitti files (download [raw data](https://www.cvlibs.net/datasets/kitti/raw_data.php)) to bag files. Run the second command to convert the dataset into bag file. 
   ```sh
   $ pip install kitti2bag
   $ kitti2bag -t 2011_09_26 -r 0002 raw_synced .
   ```

4. Catkin build the workspace
	 ```sh
	 $ catkin build -DCMAKE_BUILD_TYPE=Release
	``` 
### Directly On Host
Assuming ROS Noetic has been installed.
1. Catkin build the workspace and source it.
	 ```sh
	 $ catkin build -DCMAKE_BUILD_TYPE=Release
	 $ source devel/setup.bash
	```
2. Using tmux create 3 terminals. Run roscore and play the rosbag file in the first 2 terminals. run lidar_segmentation using the following launch file.
	 ```sh
	 $ roslaunch segmenters_lib segmentation_run.launch
	``` 
	
## Customization
To be able to run the segmentation for different topics, one can edit the ```lidar_segmentation/src/perception/libs/segmenters/config/detection.yaml``` file.
```yaml
frame_id: "velodyne" # The global frame name
sub_pc_topic: "/kitti/velo/pointcloud", # the input topic name change it to required one from CARLA or live data
```

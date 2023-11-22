# lidar_segmentation

## Demo

https://github.com/codeck313/lidar_segmentation/assets/23121752/f6e8b76e-93cb-4f3b-ae87-d55e223f781d




## Installation

1. Clone the repo.
   ```sh
   $ git clone https://github.com/codeck313/lidar_segmentation.git
   ```
2. Build the docker image using the dockerfile in the repo. 
   ```sh
   $ docker build .
   ```
   
3. Using Docker-run composer start the docker container and attach the repository folder as a volume to it.
	 ```sh
   $ docker-run --verbose --volume /path/to/the/cloned/repo:rw --network host ros:noetic-full
   ```
4. [optional] Install kitt2bag to convert the kitti files (download [raw data](https://www.cvlibs.net/datasets/kitti/raw_data.php)) to bag files. Run the second command to convert the dataset into bag file. 
   ```sh
   $ pip install kitti2bag
   $ kitti2bag -t 2011_09_26 -r 0002 raw_synced .
   ```

5. Catkin build the wprkspace
	 ```sh
	 $ catkin build -DCMAKE_BUILD_TYPE=Release
	``` 

6. Catkin build the wprkspace and source it.
	 ```sh
	 $ catkin build -DCMAKE_BUILD_TYPE=Release
	 $ sdsd
	``` 
6. Using tmux create 3 terminals. Run roscore and play the rosbag file in the first 2 terminals. run lidar_segmentation using the following launch file.
	 ```sh
	 $ roslaunch segmenters_lib segmentation_run.launch
	``` 
	

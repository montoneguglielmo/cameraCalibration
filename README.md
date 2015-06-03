# cameraCalibration

In the folder:

1) CreateRetina: the file necessary to create a square grid of photoreceptors. The user can choose the size of the grid and the grid step. The file createRetinaTest.m contains an example of what the other tow function in the folder do.

2)Load Images: the file in this folder are useful to create a dataset in the data format useful fo the algorimth of camera calibration.

-the function createFakeImageDataset creates and saves a fake dataset. it simulates the camera moving accoridng to a vertical displacement and then an orizontal displacement, exactly as it happens for the real robot. The number of environment and the number of movement can be fixed by the user. As well as the size of the images taken by the camera. For each environment a big images (the scene the camera is pointing at) is generated randomly, then an image (smapshot of the camera) is associated to each camera movement.

-the function createDatasetFromRawData receive as input the folder where the images taken form the robot are stored are returns and save a data structure useful for the camera calibration.

3)All the function necessary for performing retina calibration. -the script estimMetricRetina takes as input the kind of retina(photoreceptor grid) and the datasets. It returns the coordinate of the photoreceptors in the variable tp_estim. All the results and the parameters relevant for the algorithm are save in the structure named retina.

To try the algorithm: 1)Lunch the script createFakeImageDataset to create and save a fake dataset 2)Lunch the script estimMetricRetina

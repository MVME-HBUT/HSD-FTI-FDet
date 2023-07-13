import torch
from mmdet.apis import init_detector, inference_detector, show_result_pyplot
from tools.timer import Timer
import glob
import cv2
import numpy as np
import os
import mmcv


config_file = 'your_config.py'
val_json_file = 'data/tfds_coco/BBK_HALF/annotations/instances_val2017.json'
checkpoint_file = 'your_checkpoint.pth'

# build the model from a config file and a checkpoint file
model = init_detector(config_file, checkpoint_file, device='cuda:0')
# print(model)

imgfile = '/home/phl/LD-main/data/tfds_coco/BBK_HALF/val2017'
paths = glob.glob(os.path.join(imgfile, '*.jpg'))
paths.sort()
bboxlocation = ''
for path in paths:
	img = cv2.imread(path)
	timer = Timer()
	timer.tic()
	result = inference_detector(model, img)
	timer.toc()
	

	imgname = path.split('/')
	imgname = imgname[len(imgname)-1]
	time = ('Image {} took {:.3f}s for fault detection').format(imgname, timer.total_time)
	print(time)
	bboxes = np.vstack(result)

	try:
		bboxes = bboxes[0]
	except:
		bboxes = np.array([0, 0, 0, 0, 0])

	scores = [0.5, 0.6, 0.7, 0.8, 0.9, 1]

	for score in scores:
		if bboxes[-1]<score:
			bboxes = np.array([0, 0, 0, 0, 0])

		bboxlocation = time + '------'+imgfile + imgname + ' ' + str(1) + ' '+ ' '.join(str(int(i)) for i in bboxes[0:4]) + ' ' + ' '.join(str(round(float(i),2)) for i in bboxes[4:5]) + '\n'


		a = ('conf_{}').format(score)
		target_file = 'target_file.txt' 

		if not os.path.exists(target_file):
			os.makedirs(target_file)
		with open(target_file, mode='a') as f:  
			f.write(bboxlocation)



# Efficient Visual Fault Detection for Freight Train Braking System via Heterogeneous Self Distillation in the Wild
This is the official implementation of the Advanced Engineering Informatics paper ["Efficient Visual Fault Detection for Freight Train Braking System via Heterogeneous Self Distillation in the Wild"] ([https://arxiv.org/abs/2307.00701](https://arxiv.org/abs/2307.00701))



## Introduction
We design a lightweight and precise heterogeneous self-distillation framework for real-time fault detection on freight train images under strict resource constraints.
<div align="center"><img decoding="async" src="https://github.com/MVME-HBUT/HSD-FTI-FDet/blob/main/framework.jpg" width="75%"/> </div>

**Note:** The overall structure of our method. **HKN:** Heterogeneous Knowledge Neck. **HKH:** Heterogeneous Knowledge Head. During the backpropagation process, the regression loss is calculated by fault distribution loss **FD Loss** and fault regression loss **FR loss**. The classification loss is computed by fault classification loss **FC Loss**, and the distillation is computed by **Kullback-Leibler divergence**.



## Installation
This codebase is built upon [MMDetection] 
([https://github.com/open-mmlab/mmdetection](https://github.com/facebookresearch/detectron2))

### Requirements
* Ubuntu 20.04 LTS, CUDA>=10.1, GCC>=7.3.0
* Python>=3.7.12
* Virtual environment via Anaconda is recommended:
  Activate it by
  ```
  conda create -n HSD python=3.7
  ```
* mmdetection>=2.5.0
* Pytorch>=1.6.0, torchvision>=0.7.0
* Get into the HSD code directory (denoted by ${PROJ}).
  ```
  cd ${PROJ}
  ```



## Train and Evaluation

### Training
```
#single GPU

#multi GPU

```
### Evaluation
```
#single GPU

#multi GPU

```



## Convert model
If you find the trained model very large, please refer to publish_model.py
```
python tools/model_converters/publish_model.py your_model.pth your_new_model.pth
```



## Main Result




## Citation
```
  @misc{zhang2023efficient,
      title={Efficient Visual Fault Detection for Freight Train Braking System via Heterogeneous Self Distillation in the Wild}, 
      author={Yang Zhang and Huilin Pan and Yang Zhou and Mingying Li and Guodong Sun},
      year={2023},
      eprint={2307.00701},
      archivePrefix={arXiv},
      primaryClass={cs.CV}
}
```

## Acknowledgements
We learn and use some parts of the codes from the following projects. We thank these excellent works:
* [LD](https://github.com/HikariTJU/LD): Localization Distillation for Object Detection, CVPR 2022.
* [MMDetection](https://github.com/facebookresearch/detectron2). An open source object detection toolbox based on PyTorch. 




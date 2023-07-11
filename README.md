
# Efficient Visual Fault Detection for Freight Train Braking System via Heterogeneous Self Distillation in the Wild
This is the official implementation of the Advanced Engineering Informatics paper ["Efficient Visual Fault Detection for Freight Train Braking System via Heterogeneous Self Distillation in the Wild"] ([https://arxiv.org/abs/2307.00701](https://arxiv.org/abs/2307.00701))

This repo is based on [LD](https://github.com/HikariTJU/LD) and [MMdetection](https://github.com/open-mmlab/mmdetection).



## Introduction
We design a lightweight and precise heterogeneous self-distillation framework for real-time fault detection on freight train images under strict resource constraints.

![RUNOOB 图标](http://static.runoob.com/images/runoob-logo.png)

**Note:** The overall structure of our method. **HKN:** Heterogeneous Knowledge Neck. **HKH:** Heterogeneous Knowledge Head. During the backpropagation process, the regression loss is calculated by fault distribution loss **FD Loss** and fault regression loss **FR loss**. The classification loss is computed by fault classification loss **FC Loss**, and the distillation is computed by **Kullback-Leibler divergence**.



## Installation
This codebase is built upon [MMdetection] 
([https://github.com/open-mmlab/mmdetection](https://github.com/facebookresearch/detectron2))

### Requirements
* Ubuntu 20.04 LTS, CUDA>=10.0, GCC>=5.4.0
* Python>=3.6.12
* Virtual environment via Anaconda (>=4.10.3) is recommended:
  Activate it by
  ```
  conda create -n HSD python=3.7
  ```
* mmdetection==0.3
* Pytorch>=1.7.1, torchvision>=0.8.2
* Get into the HSD code directory (denoted by ${PROJ}).
  ```
  cd ${PROJ}
  ```



## Train
```
#single GPU

#multi GPU

```



## Test
```
#single GPU

#multi GPU

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

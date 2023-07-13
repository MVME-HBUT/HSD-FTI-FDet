#!/usr/bin/env bash

CONFIG=$1
GPUS=$2
PORT=${PORT:-29400}

PYTHONPATH="$(dirname $0)/..":$PYTHONPATH \
CUDA_VISIBLE_DEVICES=2 python -m torch.distributed.launch --nproc_per_node=$GPUS --master_port=$PORT \
    $(dirname "$0")/demo_batch.py $CONFIG --launcher pytorch ${@:3}

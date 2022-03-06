#!/usr/bin/env bash

FASTTEXT=~/fastText-0.9.2/fasttext
RAWDATA=output.fasttext.normalized

python week3/createContentTrainingData.py  --min_products 200 --output /workspace/datasets/fasttext/output.fasttext.normalized
cd /workspace/datasets/fasttext
shuf $RAWDATA > shuffled_data
head -n 10000 shuffled_data > products.training
tail -n 10000 shuffled_data > products.testing
$FASTTEXT supervised -input products.training -output model_products -epoch 25 -lr 1 -wordNgrams 2 -thread 8
$FASTTEXT test model_products.bin products.testing
#!/usr/bin/env bash

FASTTEXT=~/fastText-0.9.2/fasttext

python week3/extractTitles.py --sample_rate 1.0
cd /workspace/datasets/fasttext
$FASTTEXT skipgram -input /workspace/datasets/fasttext/titles.txt -output /workspace/datasets/fasttext/title_model -lr 0.1 -thread 4 -epoch 25 -minCount 25
for w in headphone tablet phone humidifier camera sony apple hp canon maytag trackpad ipad thinkpad zune ipod black light bluetooth wifi; do echo "orig: $w"; echo $w | ~/fastText-0.9.2/fasttext nn /workspace/datasets/fasttext/title_model.bin | perl -lne '@a = split / /; print("~ ", $a[0]) if $a[1] > 0.7'; done | tee synonyms.txt

#!/bin/bash
mv ${1}.tex tmp
rm ${1}* 
mv tmp ${1}.tex

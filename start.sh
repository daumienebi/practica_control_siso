#!/bin/bash

echo "# practica_control_siso" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M master
git remote add origin https://github.com/daumienebi/practica_control_siso.git
git push -u origin master
#!/bin/bash
printer=`lpstat -p | grep -i $1 | sed -r -e "s/.* ($1[^ .]*) .*/\1/I"`
sudo lp -d $printer $2

#!/bin/bash

while read regra; do
    $regra
done < regra.txt

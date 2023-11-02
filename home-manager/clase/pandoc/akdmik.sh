#! /bin/bash

input=$1
output=$2
default=$3

if [ -z "$input" ] || [ -z "$output" ]
then
    echo 'Argumentos inválidos, los argumentos son: input, output y (opt) default'
    exit 0
fi

pandoc_dir=~/.local/share/pandoc
dir=$(pwd)

# Leer el YAML
if [ -n "$default" ]
then
    css=$(yq '.css' $pandoc_dir/defaults/$3.yaml)
    js=$(yq '.variables.javascript' $pandoc_dir/defaults/$3.yaml)
fi


if [ -n "$css" ]
then
    cd $pandoc_dir
    mkdir $dir/css
    pwd
    cp $css $dir/css
    cd $dir
fi

if [ -n "$js" ]
then
    cd $pandoc_dir
    mkdir $dir/js
    pwd
    cp $js $dir/js
    cd $dir 
fi


if [ -n "$input" ] && [ -n "$output" ]
then
    if [ -n "$default" ]
    then
        pandoc $input -d $default -s -o $output
    fi
else
    pandoc $input -s -o $output
fi
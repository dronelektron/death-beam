#!/bin/bash

PLUGIN_NAME="death-beam"

cd scripting
spcomp $PLUGIN_NAME.sp -i include -o ../plugins/$PLUGIN_NAME.smx

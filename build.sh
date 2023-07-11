#!/bin/bash

PLUGIN_NAME="death-beam"

cd scripting
spcomp $PLUGIN_NAME.sp -o ../plugins/$PLUGIN_NAME.smx

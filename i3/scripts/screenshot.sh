#!/bin/bash

SCREEN_DIR=$HOME/Pictures/Screenshots
mkdir -p $SCREEN_DIR
import "$SCREEN_DIR/$(date +"%Y-%m-%d %H:%M:%S").png"

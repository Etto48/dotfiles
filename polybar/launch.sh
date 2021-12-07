#!/bin/bash
pkill polybar
polybar dummy_top & disown
polybar top & disown
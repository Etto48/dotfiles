#!/bin/env bash

sudo cp motd/01-custom /etc/update-motd.d/01-custom
sudo chmod +x /etc/update-motd.d/01-custom
sudo chmod -x /etc/update-motd.d/10-help
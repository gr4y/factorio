#!/bin/bash

if [ ! -f /opt/factorio/saves/save0.zip ]; then
  /opt/factorio/bin/x64/factorio --create saves/save0
fi
/opt/factorio/bin/x64/factorio --start-server saves/save0

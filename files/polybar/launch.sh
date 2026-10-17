#!/bin/bash

killall -q polybar
while pgrep -u "$UID" -x polybar >/dev/null; do sleep 0.2; done

echo "--- $(date)" >> /tmp/polybar1.log

# Retry a few times in case the monitor/modules aren't ready yet
(
  for i in 1 2 3 4 5; do
    polybar main >> /tmp/polybar1.log 2>&1
    echo "polybar exited, retry $i" >> /tmp/polybar1.log
    sleep 2
  done
) &

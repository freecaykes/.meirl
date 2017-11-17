# !/bin/bash

#
# Intended as boot script add line to /etc/rc.local:
#   sudo bash <script location>/startup_update.sh
#
# add bash script file to /etc/init.d
#

count=0
max_loop=1000
connected=0
echo "Waiting 1000 clock cycles for Wi-Fi adapter to connect"
while (( "$count" < "$max_loop" )) ; do
  count=$(($count+1))
  if [[ "$count" >=1 ]]; then
    # check wifi connection open
    count_in=0
    nmcli dev wifi | while read -r line ; do
      if [[ "$line" = [\*]* ]] && [[ "$count_in" > 0 ]]; then # connected indicated by *
        echo "Connected to SSID: $line"
        break
      fi
      count_in=1
    done
    sudo apt-get update && sudo apt-get upgrade # apt update line
    break
  fi
done

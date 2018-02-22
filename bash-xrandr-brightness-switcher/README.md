# HowTo

* First run the following code: `xrandr --current`
* Look for the parts which look like this depending on the connection you use for your monitor: `DP-0 connected 2560x1440` (there will be multiple items if you use multiple monitors.
* Edit the `switchbrightness.sh` to match your connection ports. In my case I used three DisplayPorts permanent and one HDMI (4k) which I turn on and off by time. That's why I only ensure the connection on the HDMI one. **Edit it to match your use-case.**
* Use shell to check if settings are right. `chmod +x switchbrightness.sh` and `./switchbrightness.sh 1` or (2,3,4) this should change the brightness of your monitor. I used a shortcut on my keyboard to toggle each screen individually. 

# Custom Notification Snoozing

Runs a short script to change Oreo notification snooze times at boot. By default, it sets them to 3/7/15/24hrs, but this can be changed to your preference.

## Changing the snooze time
Modify the integers in "/data/CNSvalues.txt" to customise.

After installing this module, it will create two files under `/data`. These files are `CNS.log` (a logfile for this module), and `CNSvalues.txt`. The latter is how you modify snooze times. It has the following structure:

    def=180
    a=180
    b=420
    c=900
    d=1440

Variables `a`-`d` represent the 4 choices for snooze times, with the numbers being the amount of time in seconds. Change these to change your snooze times. 

Variable `def` represents the snooze time that's chosen by default when you press the Clock button to snooze a notification. **`def` must be the same as one of the other values (a/b/c/d).** 

Simply open up `CNSvalues.txt` and change the values to your preference.
You can also make these changes by running the following from a terminal emulator app:

`printf '%s\n' 'def=180' 'a=180' 'b=420' 'c=900' 'd=1440' > "/data/CNSvalues.txt"`

(Obviously, change the values to the ones you want.)

Reboot to apply changes (or run this module's service.sh from a terminal emulator).

## Why should I use this over the System UI Tuner app?
There's an [app](https://play.google.com/store/apps/details?id=com.zacharee1.systemuituner&hl=en) which allows you to change notification snooze times without going through the complicated process of installing a Magisk module, then altering the values in a text file. I made this module as an alternative to that app, because the app needs to be running as a service the entire time your phone is on to make its changes. This module simply runs once when your phone starts, then exits. This means this module is far lighter on your battery/phone because it simply runs in the seconds after your phone launches, then stops running. If you want convenience, go for the app, but if you prefer the lightest option available, this is currently it.
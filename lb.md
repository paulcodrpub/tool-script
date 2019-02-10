# Updated: 2019.02.10

# What does it do?  
I read https://routley.io/tech/2017/11/23/logbook.html which inspired me to write this script.
I wrote shell script `lb.sh` so that I can quickly log my activities. I used to use Google Doc for journaling, but I wanted a faster way. And I found CLI and vim to be a good choice.
When I execute lb.sh on my Mac, it creates a .md file in ~/Documents/logbook/yyyy-mm-dd.md, and vim editor opens the .md file. If the folder is not there, it will be created. The goal was to remove as much friction as possible.
This script was tested on CentOS and Mac.

# What is it?    
The script lb.sh is a shell script that you can run on a Mac or a Linux (tested on CentOS 6, 7) in Terminal. By saving the script in ~/bin/ folder, it can be executed from any directory in Terminal window.

# Technologies used      
Bash shell script

# Goal of the project      
For personal use. I use it pretty much whenever I am on a computer.

# Stage of the project    
Complete.

# Known issues or things that are not properly done      
If a file such as 2019-02-10.md exists already and you run `lb.sh` on 2019-02-10, the initial date (# 2019-02-10 01hr Sunday) will not inserted into the top of the file.

# Specific things to look for      
When lb.sh is executed the twice or more between say 11:00 and 11:59, it will insert hour marker only once. I chose this option to avoid unnecessary timestamps.
On a Mac, the script will save the files in ~/Documents/logbook/. On Linux, it will save the files in ~/logbook/.
The script should be kept in  `~/bin/lb.sh`. That way, you can run `lb.sh` from any directory simply by typing `lb.sh`


# How to run it
## Get script
```
mkdir ~/bin

cd ~/bin

wget https://raw.githubusercontent.com/paulcodrpub/tool-script/master/lb.sh
OR
curl -O https://raw.githubusercontent.com/paulcodrpub/tool-script/master/lb.sh

chmod 750 lb.sh
```

# Run script
Edit `lb.sh` and update the value of variable  `_timezone`  to your choice.

ex: _timezone="America/Los_Angeles"  or _timezone="America/New_York"

Open Terminal. From any directory you can run following:
```
lb.sh
```

# Live Demo
None available

# What is this?
I am using this repo to share shell scripts I have created for personal use. 
Most are for Linux (tested on CentOS 6 or 7) and macOS.

In this README, each section includes the shell script file & a brief description on what it does.

# count-subunits-per-unit.sh
Parse a text file and count total of subunits in each unit.

Please check [count-subunits-per-unit.md](count-subunits-per-unit.md) for more details.

Content of example text file
```
# unit01-session1
# unit01-session2
# unit01-session3
# unit02-session1
# unit02-session2
# ...
# unit10-session1
# unit11-session1
```

Using script count-subunits-per-unit.sh with above source data will generate following output:
```
unit01    3
unit02    2
...
unit10    1
unit11    1
```

# yumupdate.sh
# What does it do?  
On CentOS 6 and 7, you can run this script and it will 1) "yum -y update" and 2) reboot OS, only when kernel is updated. This script will create folder  /root/logsyum to store log files. 


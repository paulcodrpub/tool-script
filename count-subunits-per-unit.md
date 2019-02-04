# Created: 2019.02.02

# File
count-subunits-per-unit.sh

# What does it do? 
Parse a text file and count total of subunits in each unit.
```
Content of example text file #
unit01-session1
unit01-session2
unit01-session3
unit02-session1
unit02-session2
...
unit10-session1
unit11-session1
```

Using the script with above source data will generate following output on Terminal screen:
```
unit01    3
unit02    2
...
unit10    1
unit11    1
```

Note that if you have unit numbering like `unit001, unit101 and unit234`, this script can handle it. 


# What is it?    
Bash shell script to be executed in Terminal of Mac or Linux

# Technologies used #
Bash shell

# Goal of the project       
For personal use. Posting here for others to view/use.

# Stage of the project  
Complete.

# Known issues or potential improvements 
1. seq is not the most optimal tool, but this is for a small text file.
2. "select opt" could've been used for more flexibility, but went with 
   simpler solution.
3. Last line in the file should contain highest unit number. If not, output
   will be incorrect.
4. Single digit number in unit number needs to be padded with 0 if there are
   10 or more units.
   ex: If largest unit number is unit 12, unit01, not unit1, should be in 
       source data.
   ex: If largest unit number is unit 115, unit001, not unit1, should be in 
       source data.
5. Output is printed on Terminal only.

# How to run it
On local Mac
`./count-subunits-per-unit.sh sourcefile.txt `

# Live Demo
None available

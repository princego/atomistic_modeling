# Linux Basics
## Remote login via ssh
Enter the below command to login to aqua. In place of roll, you have to enter your roll no, which is your username. 
```
ssh roll@aqua.iitm.ac.in
```
You have to type `yes` and press Enter key to allow connection. Then type your password and press Enter key to login. When you enter password, you won't see any black dots.

## Working with folders/directories
Command | Description |
--|--|
`ls` |List contents in the directory
`pwd` | Present working directory
`mkdir directoryname` | Create a new directory. Don't use space in between, use _ instead. If you give space 2 directories will be created.
`cd` or `cd ~/` | Switch to home directory from any directory
`cd directoryname` | Go inside a specific directory
`cd directory/subdirectory/` | Go to subdirectory 
`cd ..` | Go back to previous directory 	
`cd ../../` | Go back to two directories 
	
`mv old_name new_name` | Rename a directory

## Working with files using vi editor
Description  | Command |
--|--|
Create a new file | `vi filename`	
To start editing the new file or old file | type `i` then you'll go to inert mode and start editing.
Write changes to the file |	`:w`
To quit the file 	| `:q`
To write changes to the file and quit |	`:wq`
Save file without making changes 	| `:q!`
Delete a file |	`rm filename`
Go to the last line |	`G`
Go to first line    |	`:1 or gg`
Jump to line 25     |	`:25 or 25G`
scroll down one page forward 	| `ctrl+f`
scroll up one page backward 	| `ctrl+b`
Delete current line | press `Esc` to come out of editing mode and type `dd`
Delete 10 lines from the current line |	`10dd`
Delete 1 to 10 lines/rows 	| `:1,10d`
Delete from line 10 to the end 	| `:10,$d`

## Transfer folders/files
If you are tranferring files, after `scp`, `-r` is not required. To know the full path, type `pwd` in your terminal.

Copy directories from local to remote computer <br>
`scp -r fullpath/ user@hostname:/fullpath/`

Copy directories from remote to local computer <br>
`scp -r user@hostname:/fullpath/ /fullpath_in_local_computer`

Copy directories from remote computer to another remote computer <br>
`scp -r user1@hostname1:/fullpath/ user2@hostname2:/fullpath/`

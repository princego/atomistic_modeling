# Linux Basics
In this seesion, we will discuss the following
- Remotely accessing aqua
- Working with folders/directories
- Working with files
- Transferring files

<hr>

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
`mv old_name new_name` | Rename a directory or file
`mv directory new/path/.` | Move a directory to other directory or path
`rm filename` | Remove or delete a file
`rm -r directoryname` | Remove or delete a directory
`cp old_path new_path` | Copy a file
`cp -r old_path new_path` | Copy a directory
`cat filename` | Display a file content
`tac filename` | Display file content but in reverse order
`cat filename1 filename2` | Display multiple files
`cat filename1 filename2 > mergedfile` | Merge two or more files into one file
`cat > filename` | Create and display a new file
`grep "string" filename` | Search a string in the file
`file filename or directoryname/*` | Determine the type of a file or all files in a directory
`man commandname` | Opens a manual for the command
`echo "text"` | Prints the text in terminal
`which executablename` | Provides the path to that executable

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
Select text | `v`
Delete selected text | `d`
Delete current line | press `Esc` to come out of editing mode and type `dd`
Delete 10 lines from the current line |	`10dd`
Delete 1 to 10 lines/rows 	| `:1,10d`
Delete from line 10 to the end 	| `:10,$d`
Copy selected text | `y`
Copy current line | `yy`
Paste copied / deleted text after cursor | `p`
Paste copied / deleted text before cursor | `P`
Undo any changes in the file | `u`
Search a string in the file (2) | `/string`

(1) "Delete" is the equivalent of "Cut" in vi editor.
(2) Navigate through forward or backward through the search using `n` and `N` respectively.

## Transfer folders/files
To know the full path, type `pwd` in your terminal.

Copy directories from local to remote computer <br>
`scp -r fullpath/ user@hostname:/fullpath/`

Copy directories from remote to local computer <br>
`scp -r user@hostname:/fullpath/ /fullpath_in_local_computer`

Copy directories from remote computer to another remote computer <br>
`scp -r user1@hostname1:/fullpath/ user2@hostname2:/fullpath/`

If you are not transferring directories, but only files, after `scp`, `-r` is not required.

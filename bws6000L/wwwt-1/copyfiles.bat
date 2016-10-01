rem this is the batch file to create index.txt for the file server program
rem after creating the index.txt file remove the root directry using replace in notepad
rem also make sure that there is no space in the files names if so it will take it as a directory and report error
del index.txt
dir /B /S /A-D  >> index.txt
echo xyz >> index.txt
cls


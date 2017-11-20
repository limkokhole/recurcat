# recurcat
Recursively cat file(s) with syntax higlighting.  

How to use:  

[1]  source it first, or normally put its code in ~/.bash_aliases  

xb@dnxb:~/note/sh/recurcat$ chmod +x recurcat.sh; . recurcat.sh  

[2] Run as `recurcat <syntax type> <regex filepath>`, enjoy :)  

Screenshots:  

[1] recurcat  
![recurcat](/recurcat.png?raw=true "recurcat")  

[2] recurcat_g (if you want to pipe result of recurcat and grep)
![recurcat_g](/recurcat_g.png?raw=true "recurcat_g")  

Tips:  

Most of the case you use `sh` syntax to highlight a file or output of command if no prior knowledge of file type, since shell script and shell command output is common in Linux.  




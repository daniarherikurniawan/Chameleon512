# sudo apt-get install w3m
wget node-0.ucare.edu:50070/dfshealth -O index.html
wget node-0.ucare.edu:50070/dfsnodelist.jsp?whatNodes=LIVE -O index.html
w3m -dump index.html | less
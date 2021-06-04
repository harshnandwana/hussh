 | | | |  _   _   ___   ___  | | | | | |
 | |_| | | | | | / __| / __| | |_| | | |
 |  _  | | |_| | \__ \ \__ \ |  _  | |_|
 |_| |_|  \__,_| |___/ |___/ |_| |_| (_)

<br>
a script which can be used for recon and exploitation purpose and is a combination of various tools .
<br>
**Install**
<br>
```
git clone https://github.com/harshnandwana/hussh
```
----
**Usage**
```
$	chmod +x hussh.sh
$	./hussh <target.com>
```
----
**Dependencies**
along with all files present here use 
```
$	sudo apt-get install sublist3r
$	sudo apt-get install subfinder
$	sudo apt-get install gospider
$	sudo apt-get install golang
```
----

**Output**
<br>
To see the output move to /target/hussh-date/ and track for the file target.html and open it with your browser and you will se a page like this.

![webresults]=(https://github.com/harshnandwana/hussh/screens/1.png)
<h4 allign="center"> HussH</h4>

what this tool do.
1. it gathers subdomain using 
	* sublist3r
	* subfinder
	append these data to a text file namely combined.txt in the folder /target/hussh-date/combined.txt and trim the duplicasy
2. check for active subdomains
	* check all the active domains in the combined.txt using a tool httprobe by tomnomnom and then keep only https:// sources there as these are the ultimate target.
	* use a go script named as go to find out the status code of all the domains this script is also the modified version of a script named _ by tomnomnom and then grep out the url having status code 200 and 302. append these data to a file named a as usefull.txt
3. way back machine
	* check for the url from usefull.txt in wyback machine and writesd the output in /target/hussh-date/wb.txt
	* now using a file inturl which is also inspired from _ by tomnomnom it sorts out only intersting files from web.txt 
4. spider the subdomains
	* using gospider aas my long companion to spider the subdomains and find all other subdomains that may be available there
	* now filtering out the usfull data such as sites with url|robots|javascript|subdomains|forms using grep and appending them to a file /target/hussh-date/vulnd.txt
5. finding intersting files 
	* appending usefull.txt and vulnd.txt to a file name vuln.txt and removing the duplicates.
	* again finding interesting files from vuln.txt
6. hunting or vulnerability
	* hunt for cors vulnerability in vulns.txt using cors script by tomnomnom 

please add other vulnerability 
and fork if using

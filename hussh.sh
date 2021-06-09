#!/bin/bash

logo(){
echo "$(tput setaf 2)
 _   _                       _   _   _ 
| | | |  _   _   ___   ___  | | | | | |
| |_| | | | | | / __| / __| | |_| | | |
|  _  | | |_| | \__ \ \__ \ |  _  | |_|
|_| |_|  \__,_| |___/ |___/ |_| |_| (_)

$(tput sgr 0)" 
}

domenum(){
  subfinder -d $1 -o ./$1/$foldername/findf.txt> /dev/null													#use subfinder for domain enum
  clear
  logo
  sublist3r -d $1 -o ./$1/$foldername/listf.txt> /dev/null													#use sublist3r for domain enum  > here is append
  clear
  logo
  cat ./$1/$foldername/findf.txt ./$1/$foldername/listf.txt > ./$1/$foldername/combined.txt													#combine all domains
  ./trace ./$1/$foldername/combined.txt >> ./$1/$foldername/filtered.txt 									#remove duplicate to save resources
}

activedom(){
  cat ./$1/$foldername/filtered.txt |./httprobe |tee -a ./$1/$foldername/httpf.txt											#check which domains are with port 80 or 443 open
  cat ./$1/$foldername/httpf.txt |grep "https" |tee -a ./$1/$foldername/httpxf.txt
  sort ./$1/$foldername/httpxf.txt > ./$1/$foldername/httprobe.txt
  ./go ./$1/$foldername/httprobe.txt| tee -a ./$1/$foldername/statf.txt 													#used to detect status code
  cat ./$1/$foldername/statf.txt|grep "200" |awk '{print $4}'| tee -a ./$1/$foldername/usefull.txt							#list all url with "200" to usefull.txt
  cat ./$1/$foldername/statf.txt|grep "302" |awk '{print $4}'| tee -a ./$1/$foldername/usefull.txt							#list all url with "302" to usefull.txt
}
waybackmachine(){
  cat ./$1/$foldername/usefull.txt|./waybackurls >>./$1/$foldername/wb.txt
  cat ./$1/$foldername/wb.txt |./inturl >>./$1/$foldername/wbinterest.txt
}
spider(){
  gospider -o ./$1/$foldername/gspoutput -S ./$1/$foldername/usefull.txt														#spider all domains.
  cd ./$1/$foldername/gspoutput
  cat * >> all.txt
  cat all.txt |grep "url" |awk '{print $5}' | grep -P '[(?:https:\/\/|www\.|https:\/\/)]([^\/]+)' >> urls.txt
  cat all.txt |grep "robots" |awk '{print $3}' | grep -P '[(?:https:\/\/|www\.|https:\/\/)]([^\/]+)' >> robots.txt
  cat all.txt |grep "javascript" |awk '{print $3}' | grep -P '[(?:https:\/\/|www\.|https:\/\/)]([^\/]+)' >> javas.txt
  cat all.txt |grep "subdomains" |awk '{print $3}' | grep -P '[^(?:https:\/\/|www\.|https:\/\/)]([^\/]+)' >> subd.txt
  cat all.txt |grep "form"  |awk '{print $3}' | grep -P '[(?:https:\/\/|www\.|https:\/\/)]([^\/]+)' >> forms.txt
  cat urls.txt robots.txt javas.txt subd.txt forms.txt >>vulnd.txt
  rm all.txt
  cd ../../..
}
intersting(){
    cat ./$1/$foldername/usefull.txt ./$1/$foldername/gspoutput/vulnd.txt >>./$1/$foldername/vulna.txt
    ./trace ./$1/$foldername/vula.txt >> ./$1/$foldername/vulns.txt   
    cat ./$1/$foldername/vulns.txt |./inturl >>./$1/$foldername/interes.txt
}

vuln(){

  cat ./$1/$foldername/vulns.txt| ./cors |tee -a ./$1/$foldername/cors.txt                                    # check for cors
  
}


html(){
  touch ./$1/$foldername/$1.html
  echo "<title> HussH! </title>" >> ./$1/$foldername/$1.html
  echo "<html>" >> ./$1/$foldername/$1.html
  echo "<head>" >> ./$1/$foldername/$1.html
  echo "<link rel=\"stylesheet\" href=\"https://fonts.googleapis.com/css?family=Mina\" rel=\"stylesheet\">" >> ./$1/$foldername/$1.html
  echo "</head>" >> ./$1/$foldername/$1.html
  echo "<body><meta charset=\"utf-8\"> <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\"> <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\"> <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js\"></script> <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\"></script></body>" >> ./$1/$foldername/$1.html
  echo "<div class=\"jumbotron text-center\"><h1> Recon Report for <a/href=\"http://$1\">$1</a></h1>" >> ./$1/$foldername/$1.html
  echo ""
  echo "   <div clsas=\"row\">" >> ./$1/$foldername/$1.html
  echo "     <div class=\"col-sm-6\">" >> ./$1/$foldername/$1.html
  echo "<style> p { border: no border; margin: 10px; } </style>" >> ./$1/$foldername/$1.html
  echo "<div style=\"font-family: 'Mina', serif;\"><h2> see subdomains enumeration reports <a href="./filtered.txt ">Here</a></h2></div>" >> ./$1/$foldername/$1.html
  echo " </div>" >> ./$1/$foldername/$1.html
  echo "   <p>  <div class=\"col-sm-6\">" >> ./$1/$foldername/$1.html
  echo "<div style=\"font-family: 'Mina', serif;\"><h2> see active website here <a href="./httprobe.txt">Here</a></h2></div>" >> ./$1/$foldername/$1.html
  echo " </div> </p>" >> ./$1/$foldername/$1.html
  echo "   <p>  <div class=\"col-sm-6\">" >> ./$1/$foldername/$1.html
  echo "<div style=\"font-family: 'Mina', serif;\"><h2> all usefull domains <a href="./usefull.txt">Here</a></h2></div>" >> ./$1/$foldername/$1.html
  echo " </div> </p>" >> ./$1/$foldername/$1.html
  echo "   <p>  <div class=\"col-sm-6\">" >> ./$1/$foldername/$1.html
  echo "<div style=\"font-family: 'Mina', serif;\"><h2> all domains with cors vulnerability <a href="./cors.txt">Here</a></h2></div>" >> ./$1/$foldername/$1.html
  echo " </div> </p>" >> ./$1/$foldername/$1.html
  echo "   <p>  <div class=\"col-sm-6\">" >> ./$1/$foldername/$1.html
  echo "<div style=\"font-family: 'Mina', serif;\"><h2> all interesting wayback domains<a href="./wbinterest.txt">Here</a></h2></div>" >> ./$1/$foldername/$1.html
  echo " </div> </p>" >> ./$1/$foldername/$1.html
  echo "   <p>  <div class=\"col-sm-6\">" >> ./$1/$foldername/$1.html
  echo "<div style=\"font-family: 'Mina', serif;\"><h2> postspider data <a href="./gspoutput/">Here</a></h2></div>" >> ./$1/$foldername/$1.html
  echo " </div> </p>" >> ./$1/$foldername/$1.html
  echo "   <p>  <div class=\"col-sm-6\">" >> ./$1/$foldername/$1.html
  echo "<div style=\"font-family: 'Mina', serif;\"><h2> all robots file <a href="./gspoutput/robots.txt">Here</a></h2></div>" >> ./$1/$foldername/$1.html
  echo " </div> </p>" >> ./$1/$foldername/$1.html
  echo "   <p>  <div class=\"col-sm-6\">" >> ./$1/$foldername/$1.html
  echo "<div style=\"font-family: 'Mina', serif;\"><h2> URL files <a href="./gspoutput/urls.txt">Here</a></h2></div>" >> ./$1/$foldername/$1.html
  echo " </div> </p>" >> ./$1/$foldername/$1.html
  echo "   <p>  <div class=\"col-sm-6\">" >> ./$1/$foldername/$1.html
  echo "<div style=\"font-family: 'Mina', serif;\"><h2> all javascript file <a href="./gspoutput/javas.txt">Here</a></h2></div>" >> ./$1/$foldername/$1.html
  echo " </div> </p>" >> ./$1/$foldername/$1.html
  echo "   <p>  <div class=\"col-sm-6\">" >> ./$1/$foldername/$1.html
  echo "<div style=\"font-family: 'Mina', serif;\"><h2> all form files <a href="./gspoutput/forms.txt">Here</a></h2></div>" >> ./$1/$foldername/$1.html
  echo " </div> </p>" >> ./$1/$foldername/$1.html
  echo "   <p>  <div class=\"col-sm-6\">" >> ./$1/$foldername/$1.html
  echo "<div style=\"font-family: 'Mina', serif;\"><h2> all subdomains internally listed files <a href="./gspoutput/subd.txt">Here</a></h2></div>" >> ./$1/$foldername/$1.html
  echo " </div> </p>" >> ./$1/$foldername/$1.html
  echo "   <p>  <div class=\"col-sm-6\">" >> ./$1/$foldername/$1.html
  echo "<div style=\"font-family: 'Mina', serif;\"><h2> all interesting domans/subdomains <a href="./interes.txt">Here</a></h2></div>" >> ./$1/$foldername/$1.html
  echo " </div> </p>" >> ./$1/$foldername/$1.html



}

main(){
  clear
  logo
  if [ -d "./$1" ]
  then
    echo "This is a known target."
  else
    mkdir ./$1
  fi
  mkdir ./$1/
  mkdir ./$1/$foldername/

  domenum $1
  clear
  logo
  activedom $1
  clear
  logo
  waybackmachine $1
  spider $1
  clear
  logo
  vuln $1
  html $1

}

logo

if [ ! "$1" ]; then
  echo "enter domain"
  echo "Usage   $ ./hussh <google.com>"
fi
foldername=hussh-$(date +"%Y-%m-%d")
main $1
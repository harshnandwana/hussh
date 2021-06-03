html(){
  rm ./$1/$foldername/$1.html
   touch ./$1/$foldername/$1.html
  echo "<title> report for $1 </title>" >> ./$1/$foldername/$1.html
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



}

foldername=recon-$(date +"%Y-%m-%d")
html $1


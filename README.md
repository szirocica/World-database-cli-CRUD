# World-database-Cli
Cli CRUD application in perl, using MySql database and regular expressions.

The app allows to:
 - Create, List, Update, Remove countries
 - Create, List, Update, Remove cities
 - Create, List, Update, Remove languages

How to run:<br>
 - Open xampp, start MySql<br>
 - Open localhost in your favorite browser<br>
 - Create database by importing world_x.sql<br>

 - If you don't have, download perl preferably 5.14<br>
 - Install DBD::mysql Module:<br>
    C:\>perl -MCPAN -e shell<br>
    cpan> install DBD:mysql<br>
  
 - run by:<br>
    perl .\world_database_cli.pl -w<br>
    
 To View commands use "?"

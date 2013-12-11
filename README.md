cjspray
=======

Mobile Rig Configurator


INSTALLATION
===========================================================================================

MySQL Database:
Create a new mysql database
Import the sql file included:
/sql/cjspray_2013-12-10.sql

PHP:
1. Unzip entire contents of the included zip file to “/buildmyrig/beta” directory

2. Update the database.php config file with the MySql connection info created above.
/application/config/database.php

3. Make sure mbstring php extension is installed and enabled. I’ve included the extension in the /ext folder. There’s also a php.ini file which includes for your reference the line of code to add to your php ini file.

3. Change the write permissions on the downloads directories to 777
/downloads/
/downloads/images
/downloads/pdfs

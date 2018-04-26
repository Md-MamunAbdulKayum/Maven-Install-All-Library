# Maven-Install-All-Library
Install all library from a directory with batch script with a single run

Normally we have to do maven install for a library like:
mvn install:install-file -Dfile=MyJar.jar  -DgroupId=com.mycompany.lib -DartifactId=MyJar  -Dversion=1.0 -Dpackaging=jar

So, if we have a lot of library(jar) we have to install them separately. Here using this script we can do a single run of it.  
In the script we have to just change the directory path where your all library are exist like:

set "FileFolderDir=%F:\learning\Library%"     // change accordingly



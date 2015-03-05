@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem    Lucee Startup script for Windows
@rem    Requires Java JDK 7+ setup correctly
@rem	Java 8+ recommended, Java 7 public updates cease on 4/2015
@rem    David Seong <melinite@gmail.com> 
@rem
@rem ##########################################################################

::  set name of lucee war
set LUCEE_WAR=lucee-4.5.1.000.war

::  set jetty base MUST HAVE "work" directory to keep app deployed staticly
set JETTY_BASE=.

::  port to serve
set JETTY_PORT=8080

::  context path *when serving request and runner file
set JETTY_CONTEXT=/
set JETTY_RUNNER=jetty-runner.jar

::  jvm opts
set JAVA_OPTS=-Xms512m -Xmx512m

:: basic work folder check .. can be omitted if you want to save nothing.
if not exist "%JETTY_BASE%\work" mkdir "%JETTY_BASE%\work"


PATH %PATH%;%JAVA_HOME%\bin\

:: check for min java 7
for /f tokens^=2-5^ delims^=.-_^" %%j in ('java -fullversion 2^>^&1') do set "javaversion=%%j%%k%%l%%m"
if %javaversion% LSS 17000 (
 echo !!! Your Java version in the home path is not 7 or 8 !!!
 pause
 exit
    )

:: if java 8 then add metaspace option
if %javaversion% GTR 18000 (

set JAVA_OPTS=%JAVA_OPTS% -XX:MaxMetaspaceSize=256M

    )

java.exe %JAVA_OPTS% "-Djetty.base=%JETTY_BASE%" -jar %JETTY_RUNNER% --disablefilebuffer --stats unsecure --port %JETTY_PORT% --path %JETTY_CONTEXT%  %LUCEE_WAR%





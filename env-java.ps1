set-item -path Env:JAVA_HOME -value "C:\Dev\Java\jdk1.6.0_21"
set-item -path Env:CLASSPATH -value ""
set-item -path Env:ANT_HOME -value (Join-Path $tools "apache-ant-1.8.1")

( (Join-Path $env:JAVA_HOME "bin"),
  (Join-Path $env:ANT_HOME "bin"),
  (Join-Path $tools "clojure-1.2.0"),
  (Join-Path $tools "nailgun"),
  (Join-Path $tools "gradle-0.9-rc-1/bin")
) | foreach { $env:path += ";$_" }

new-alias clj call-clojure
new-alias yEd call-yEditor

function call-yEditor {
    java.exe -jar (Join-Path (Join-Path $tools "yEd*" -resolve) yed.jar)
}
function call-gantProject {
    java.exe -jar (Join-Path (Join-Path $tools "gantproject*" -resolve) eclipsito.jar)
}

function call-clojure {
    
    ( (Join-Path $tools "clojure-1.2.0/clojure.jar"),
      (Join-Path $tools "clojure-contrib-1.2.0/target/clojure-contrib-1.2.0.jar")
    ) | foreach { $cp += ";$_" }

    java -cp $cp clojure.main 
}


function nailgun {
    
#    ( (Join-Path $tools "clojure-1.2.0/clojure.jar"),
#      (Join-Path $tools "clojure-contrib-1.2.0/target/clojure-contrib-1.2.0.jar"),
#      (Join-Path $tools "vimclojure-2.1.2/build/vimclojure.jar")
#    ) | foreach { $cp += ";$_" }

     start-process gradle -ArgumentList "runNailgun --build-file $projectRoot\oss\vimclojure\build.gradle"
}

node{
    stage('SCM Checkout'){
     git "https://github.com/narendra9582/maven-data/new/master"
     }
     stage('compile-package'){
     def mvnHome = tool name: 'maven3.6', type: 'maven'
         sh "${mvnHome}C:\Users\narendrasharma\Downloads\apache-maven-3.6.3-bin\apache-maven-3.6.3\bin\mvn package"
     }
     }
     
     
     

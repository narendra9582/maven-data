node{
    stage('SCM Checkout'){
     git "https://github.com/narendra9582/maven-data"
     }
     stage('compile-package'){
     def mvnHome = tool name: 'maven3.6', type: 'maven'
         sh "${mvnHome}/bin/mvn.package"
     }
     }
     
     
     

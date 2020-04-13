pipeline{
   agent any 
   tools{
     maven 'maven3.6'
}

 
   stages {

              stage("Code Checkout") {
                                steps {
                                       git url: 'https://github.com/narendra9582/maven-data.git'
                                      }
                                     }
              stage('Build Stage') {
                               steps{
                                       bat 'mvn package'  
                                     }
                                    }
              stage('Compile Stage'){
                                steps{
                                       bat 'mvn clean compile'
                                      }
                                     }
              stage('Testing Stage'){
                                steps{
                                      bat 'mvn test'
                                     } 
                                    }
              stage('build && SonarQube analysis'){
                                steps {
                                       withSonarQubeEnv('sonar') {
                                                                     bat 'mvn clean package sonar:sonar'
                                                                 } 
                                      } 
                                    }

               stage('Deploy to tomcat'){
                                steps{
                                       bat "copy target\\HelloWorld.war \'C:\\Users\\narendrasharma\\apache-tomcat-8.5.51-windows-x64\\apache-tomcat-8.5.51\\webapps\'"
                                     }
                                   }
        
       
    
      
                                   }
}

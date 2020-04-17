pipeline{ environment {
    registry = "narendra9582/narendra"
    registryCredential = 'docker'
  }  
   agent any 
   tools{
       JDK 'jdk-8'
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
                                       bat 'mvn compile'
                                      }
                                     }
              stage('Testing Stage'){
                                steps{
                                      bat 'mvn test'
                                     } 
                                    }
              stage('SonarQube analysis'){
                                steps {
                                       withSonarQubeEnv('sonar') {
                                                                     bat 'mvn sonar:sonar'
                                                                 } 
                                      } 
                                    }
                     stage('Deploy artifact'){
                                steps{
                                    bat 'mvn deploy'
                                      }
                                     }

               stage('Deploy to tomcat'){
                                steps{
                                       bat "copy target\\narendra-mvn.war \"C:\\Users\\narendrasharma\\apache-tomcat-8.5.51-windows-x64\\apache-tomcat-8.5.51\\webapps\""
                                     }
                                   }

       stage('Building image') {
           steps{
               bat 'docker build -t narendra9582/narendra:%BUILD_NUMBER% .'
           }
       }
       stage('Deploy image') {
           
           
    steps{
        bat 'docker push narendra9582/narendra:%BUILD_NUMBER%'
    }
}
       
       stage('Kill older container & Run Latest container'){
           steps{
               bat 'docker rm -f narendra-mvn'
               bat 'docker run -d --name narendra-mvn -p 80:8080 narendra9582/narendra:%BUILD_NUMBER%'
           }
       }
   }
}


pipeline{ environment {
    registry = "narendra9582/narendra"
    registryCredential = 'docker'
  }  
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
              stage('SonarQube analysis'){
                                steps {
                                       withSonarQubeEnv('sonar') {
                                                                     bat 'mvn clean package sonar:sonar'
                                                                 } 
                                      } 
                                    }
                     stage('Deploy artifact'){
                                steps{
                                      rtServer (id: 'artifactory',url: 'http://localhost:8040/artifactory',username: 'admin',password: 'nardev.k1')
                                      rtUpload (serverId: 'artifactory',spec: '''{"files": [{ "pattern": "/**.war","target": "maven_artifact/"}]}''')
                                      }
                                     }

               stage('Deploy to tomcat'){
                                steps{
                                       bat "copy target\\narendra-mvn.war \"C:\\Users\\narendrasharma\\apache-tomcat-8.5.51-windows-x64\\apache-tomcat-8.5.51\\webapps\""
                                     }
                                   }
        stage('Building image') {
    steps{
      script {
       dockerImage= docker.build registry + ":$BUILD_NUMBER"
      }
    }
  }
  
  stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
       
    
      
                                   }
}


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
              stage('Deploy artifact'){
                                steps{
                                      rtServer (id: 'artifactory',url: 'http://localhost:8040/artifactory',username: 'admin',password: 'nardev.k1')
                                      rtUpload (serverId: 'artifactory',spec: '''{"files": [{ "pattern": "/**.war","target": "maven_artifact/"}]}''')
                                      }
                                     }
                                   }
}

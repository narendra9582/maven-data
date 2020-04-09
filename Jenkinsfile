pipeline{
    agent any
    
    tools{
        maven "maven3.6"
    }

 

    stages {
        stage('Code Checkout'){
            steps{
                git url: 'https://github.com/narendra9582/maven-data.git'
            }
        }
        stage('Build Stage'){
            steps{
                bat 'mvn clean test'
            }
    }
        stage('Unit Test Stage'){
            steps{
                echo 'Unit Test Passes Successfully'
        }
    }


           stage('SonarQube analysis') {
               steps{
                withSonarQubeEnv('sonar'){
                    bat 'mvn sonar:sonar'
                }
            }
                 withSonarQubeEnv(credentialsId: '6fde699c09af6caea49f0f8e1c49830cd3f2e40b', installationName: 'sonar') {
                 sh 'mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.7.0.1746:sonar'
                 }
                 
           }
         }   
      }
  

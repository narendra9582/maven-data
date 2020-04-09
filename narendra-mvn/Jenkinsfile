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

 

        stage('SonarQube Analysis'){
            steps{
                withSonarQubeEnv('Sonar_Qube'){
                    bat 'mvn sonar:sonar'
                }
            }
        }
            
    }
}

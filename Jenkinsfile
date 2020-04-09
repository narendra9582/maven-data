node {
  stage('SCM') {
    git url: 'https://github.com/narendra9582/maven-data.git'
  }
  stage('compile-resources'){
    def mvnHome = tool name: 'maven3.6', type: 'maven'
    sh "${mvmHome}/bin/mvn package"
  }
  stage('SonarQube analysis') {
    def mvnHome = tool name: 'maven3.6', type: 'maven'
    withSonarQubeEnv('sonar') {
      sh "${mvmHome}/bin/mvn sonar:sonar"
    }
  }
}
      
  

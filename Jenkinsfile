pipeline {
    agent any
    tools {
    maven 'maven'
  }
     environment {
        SCANNER_HOME = tool 'sonarqube-server'
    }
    stages {
        stage('git checkout') {
            steps {
            git 'https://github.com/githubprabha/java_webapplication.git'
            }
        }
        stage('compile') {
            steps {
              sh 'mvn clean compile'
            }
        }
        stage('code analysis') {
            steps {
              withSonarQubeEnv('sonarqube-scanner') {
               sh ''' $SCANNER_HOME/bin/sonar-scanner -Dsonar.projectName=java_webapplication \
               -Dsonar.java.binaries=. \
               -Dsonar.projectKey=java_webapplication'''
              }
            }
        }
        // stage('docker-stage-clear') {
        //   steps {
        //       sh 'docker stop $(docker ps -q)'
        //       sh 'docker rm $(docker ps -aq)'
        //       sh 'docker rmi $(docker images -q)'
        //    }
        // }
        stage('docker-image') {
          steps {
            sh 'docker build -t java-web .'
          }
        }
        stage('docker-container') {
          steps {
            sh 'docker run -itd -p 8081:8080 java-web' 
          }
        }
    }
    // post {
    //     always {
    //         echo 'slack Notification.'
    //         slackSend channel: '#java-ci-cd-pipeline', message: 'Build success'
    //     }
    // }
}

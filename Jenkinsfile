pipeline {
  environment {
    imagename = "ismailtest"
        dockerImage = ''
  } 
  agent any
  stages {
    stage('Cloning Git') {
      steps {
                checkout scm
                git([url: 'git@github.com:Pallavic9/simple-java-maven-app.git', branch: 'master', credentialsId: 'git_key'])


      }
    }
    stage('Building Maven project') {
      steps{
        steps {
        
          sh 'mvn clean install'
        }
      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build imagename
        }
      }
    }
   
stage('Deploy Master Image') {
   when {
      anyOf {
            branch 'master'
      }
     }
      steps{
        script {
          docker.withRegistry(ecrurl, ecrcredentials) {     
            dockerImage.push("$BUILD_NUMBER")
             dockerImage.push('latest')

          }
        }
      }
    }

 
    stage('Remove Unused docker image - Master') {
      when {
      anyOf {
            branch 'master'
      }
     }
      steps{
        sh "docker rmi $imagename:$BUILD_NUMBER"
         sh "docker rmi $imagename:latest"

      }
    } // End of remove unused docker image for master
  }  
} //end of pipeline

pipeline {

  /*
   * Basic Pipeline
   */
  agent any


  stages {
    stage('build') {

      steps {
        echo 'Building'
        powershell returnStatus: true, script: '.\updatechrome.ps1'
        
        }
    }
     

   stage('test') {

      steps {
        echo 'Testing'
        }
    }
    
    stage('deploy') {

      steps {
        echo 'deploy'
        }
    }



  }
}

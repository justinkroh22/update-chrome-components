pipeline {

  /*
   * Basic Pipeline
   */
  agent any


  stages {
    stage('build') {

      steps {
        echo 'Building'
        powershell returnStatus: true, script: '.\\updatechromecomponents.ps1'
        
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

pipeline {
  agent {
        label 'linux'
    }
    tools {
            maven 'Maven'
            jdk 'JDK17'
    }

    stages {
        stage('package') {
            steps {
                echo 'Pakage'
                sh 'mvn clean package'
            }
        }
        stage('Docker Build') {
                steps {
                    sh 'docker build -t abhi_patil/sportclub-backend:latest .'
                }
        }
     stage('scan') {
          steps { 
        //         sh 'trivy image abhi_patil/sportclub-backend:latest'
            sh 'curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/html.tpl > html.tpl'
			sh 'mkdir -p reports'
			sh 'trivy image --ignore-unfixed --vuln-type os,library --format template --template "@./html.tpl" -o reports/trivy-scan.html abhi_patil/sportclub-backend:latest'
publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'reports', reportFiles: 'trivy-scan.html', reportName: 'Trivy Scan', reportTitles: '', useWrapperFileDirectly: true])   
	  }
        }
       
}
}

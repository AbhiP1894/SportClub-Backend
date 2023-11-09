/* groovylint-disable CompileStatic, DuplicateStringLiteral, LineLength, NestedBlockDepth, NglParseError */
pipeline {
    environment {
        DATE = new Date().format('yy.M')
        TAG = "${DATE}.${BUILD_NUMBER}"
        SNYK_TOKEN = 'e6c8fb1c-4604-4c67-a26b-5b48a5effa3a'
       // defectDojoAPIKey = '22ef34fa883e7b86a9824e7d9fdf8f77822ce771'
    }
   
    agent {
        label 'linux'
    }

    tools {
        maven 'Maven'
        jdk 'JDK11'
    }

   stages {
        stage('package') {
            steps {
                sh 'mvn -N io.takari:maven:wrapper -Dmaven=3.6.3'
                echo 'Pakage'
                sh 'mvn clean package'
            }
        }
        // stage('Sonar Analysis') {
        //     steps{
        //         withSonarQubeEnv(credentialsId: 'abhijeet-sonar-token', installationName: 'SonarQube') {
        //         // some block
        //         sh 'sonar-scanner'
        //         }
        //     }
        // }  
       stage('Docker Build') {
          steps {
               sh 'docker build -t sportclub-backend:latest .'
           }
       }
       stage('SnykScanning') {
           steps {
               sh 'snyk auth ${SNYK_TOKEN}' 
               // sh 'snyk container test sportclub-backend:latest --json > results-sportclub.json'
               script {
                  // def snykScanResult =
                      sh(script: 'snyk container test sportclub-backend:latest --json | tee snyk-report.json')
                    //  if (snykScanResult == 0) {
                    //     // Snyk scan was successful, save the JSON report
                    //     writeFile file: 'snyk-report.json', text: snykScanResult
                    // } else {
                    //     error('Snyk scan failed. Check for issues and try again.')
                    // }
              }
              // sh 'snyk container test sportclub-backend:latest --json > results-sportclub.json'
             //  sh 'snyk container test sportclub-backend:latest > result.json'
           }
       }
       stage('Publish Snyk Report to DefectDojo') {
            steps {
                script {
                    def defectDojoURL = 'http://172.27.59.220:8080/'
                    def defectDojoAPIKey = '22ef34fa883e7b86a9824e7d9fdf8f77822ce771'
                    // Send the Snyk report to DefectDojo
                    sh """
                        curl -X POST \
                        -H 'Authorization: ApiKey ${defectDojoAPIKey}' \
                        -H 'Content-Type: application/json' \
                        -d @snyk-report.json \
                        ${defectDojoURL}/api/v2/import-snyk/
                    """
                }
            }
        }
   }
}


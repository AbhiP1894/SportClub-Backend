/* groovylint-disable CompileStatic, DuplicateStringLiteral, LineLength, NestedBlockDepth, NglParseError */
pipeline {
    environment {
        DATE = new Date().format('yy.M')
        TAG = "${DATE}.${BUILD_NUMBER}"
        // SNYK_TOKEN = credentials('snyk-api-abhijieet')
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
                echo 'Pakage'
                sh 'mvn clean package'
            }
        }
        
    //     stage('Sonar Analysis') {
    //         
    //         withSonarQubeEnv(credentialsId: 'abhijeet-sonar-token', installationName: 'SonarQube') {
    // // some block
    //            sh 'sonar-scanner'
    //         }
    //     }
    // }
            
        stage('Docker Build') {
            // when {
                // branch 'release'
             //}
                steps {
                    sh 'docker build -t abhi_patil/sportclub-backend:latest .'
                }
             }
        
          stage('SnykScanning') {
                 steps {
                      snykSecurity snykInstallation: 'Snyk',
                      snykTokenId: 'snyk-api-abhijieet'
                      sh snyk test abhi_patil/sportclub-backend:latest"
                     // targetFile: 'Dockerfile'
                     // One or more steps need to be included within the steps block.
                     // snykSecurity snykInstallation: 'Snyk',
                     // snykTokenId: 'snyk-api-abhijieet'
                     // sh 'snyk test abhi_patil/sportclub-backend:latest'
                 }
             } 
    }
}

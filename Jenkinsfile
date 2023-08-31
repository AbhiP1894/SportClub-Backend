/* groovylint-disable CompileStatic, DuplicateStringLiteral, LineLength, NestedBlockDepth, NglParseError */
pipeline {
    environment {
        DATE = new Date().format('yy.M')
        TAG = "${DATE}.${BUILD_NUMBER}"
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
                    sh 'docker build -t abhi_patil/sportclub-backend:latest .'
                }
             }
        
        // stage('Snyk Scan') {
        //     steps {
        //         sh'snyk auth snyk-api-abhijieet'8e6e965d-98b5-4a16-af75-89d35e9618ac
        //         sh 'snyk test abhi_patil/sportclub-backend:latest'
        //     }
        // }
        
          stage('SnykScanning') {
               steps {
                    snykSecurity failOnIssues: false,
                        severity: 'critical',
                        snykInstallation: 'Snyk',
                        snykTokenId: 'snyk-api-abhijieet'
                   sh'snyk auth ${snykTokenId}'
                   sh 'snyk test abhi_patil/sportclub-backend:latest'
                        // snykInstallation: 'Snyk',
                        // snykTokenId: 'snyk-api-abhijieet'
                // script {
                //     // Authenticate with Snyk using API token
                //     // withCredentials([string(credentialsId: 'snyk-api-abhijieet', variable: 'SNYK_TOKEN')]) {
                //         sh 'snyk config set snyk-api-abhijieet'
                //     // }
                //     // Run Snyk Docker image scan
                //     sh 'snyk container test abhi_patil/sportclub-backend:latest'
                // }
          //    }
          // }
    }
}

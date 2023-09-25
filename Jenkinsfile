/* groovylint-disable CompileStatic, DuplicateStringLiteral, LineLength, NestedBlockDepth, NglParseError */
pipeline {
    environment {
        DATE = new Date().format('yy.M')
        TAG = "${DATE}.${BUILD_NUMBER}"   
        SNYK_API_TOKEN = credentials('snyk-token')
    }
   
    agent {
        label 'linux'
    }

    tools {
        maven 'Maven'
        jdk 'JDK11'
    }

   stages {
    //    stage('package') {
      //      steps {
        //        sh 'mvn -N io.takari:maven:wrapper -Dmaven=3.6.3'
          //      echo 'Pakage'
            //    sh 'mvn clean package'
            //}
        //}
        
        // stage('Sonar Analysis') {
        //     steps{
        //         withSonarQubeEnv(credentialsId: 'abhijeet-sonar-token', installationName: 'SonarQube') {
        //         // some block
        //         sh 'sonar-scanner'
        //         }
        //     }
        // }
            
 //stage('Docker Build') {
 //               steps {
   //                 sh 'docker build -t sportclub-backend:latest .'
     //           }
       //      }
         
          stage('SnykScanning') {
               steps {
                       withCredentials([string(credentialsId: 'snyk-token', variable: 'SNYK-TOKEN')]) {
                           // snykSecurity failOnIssues: false,
                            severity: 'critical',
                            snykInstallation: 'Snyk',
                           //snykTokenId: 'snyk-token'
                               sh 'snyk auth ${SNYK-TOKEN}' 
                                   //8e6e965d-98b5-4a16-af75-89d35e9618ac'
                               sh 'snyk container test sportclub-backend:latest --json | snyk-to-html -o results-sportclub.html'
                            // snykInstallation: 'Snyk',withCredentials([string(credentialsId: 'snyk-token', variable: 'snyk-token')]) {
    // some block}
                       }
               }
          }
    }
}

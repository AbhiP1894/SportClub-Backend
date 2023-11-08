/* groovylint-disable CompileStatic, DuplicateStringLiteral, LineLength, NestedBlockDepth, NglParseError */
pipeline {
    environment {
        DATE = new Date().format('yy.M')
        TAG = "${DATE}.${BUILD_NUMBER}"
        SNYK_TOKEN = 'e6c8fb1c-4604-4c67-a26b-5b48a5effa3a'
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
      // stage('Docker Build') {
        //   steps {
          //     sh 'docker build -t sportclub-backend:latest .'
           //}
       //}
       stage('SnykScanning') {
           steps {
               sh 'snyk auth ${SNYK_TOKEN}' 
               //sh 'snyk container test sportclub-backend:latest --json | snyk-to-html -o results-sportclub.html'
              // sh 'snyk container test sportclub-backend:latest --json > results-sportclub.json'
             //  sh 'snyk container test sportclub-backend:latest > result.json'
               sh 'snyk test > result.json'
           }
       }
   }
}


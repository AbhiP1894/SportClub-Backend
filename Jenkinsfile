/* groovylint-disable CompileStatic, DuplicateStringLiteral, LineLength, NestedBlockDepth, NglParseError */
pipeline {
    environment {
        DATE = new Date().format('yy.M')
        TAG = "${DATE}.${BUILD_NUMBER}"
    }
    //agent {
      //  label 'linux'
    //}
    agent any
    
    tools {
            maven 'Maven'
            jdk 'JDK11'
    }

    stages {
    //     stage('validate') {
    //         steps {
    //             echo 'VALIDATE'
    //             sh 'mvn clean validate'
    //         }
    //     }
    //     stage('Compile') {
    //         steps {
    //             echo 'COMPILE'
    //             sh 'mvn clean compile'
    //         }
    //     }

    //     stage('test') {
    //         steps {
    //             echo 'Test'
    //             sh 'mvn clean test'
    //         }
    //     }

        stage('Sonar Analysis') {
             steps {
                 bat 'mvn clean install'
                 bat 'sonar -scanner'
                 bat 'mvn sonar:sonar -Dsonar.token=d2230529f99493bc4fd4af42138ec361e736eb5c'
                 
             }
         }

        stage('package') {
            steps {
                echo 'Pakage'
                bat 'mvn clean package'
            }
        }
        //stage('Docker Build') {
            // when {
            //     branch 'release'
            // }
            // stage('Build') {
          //      steps {
                    // sh 'snyk config set 8e6e965d-98b5-4a16-af75-89d35e9618ac'
            //        sh 'docker build -t abhi_patil/sportclub-backend:latest .'
                    // sh 'snyk test abhi_patil/sportclub-backend:latest'
              //  }
            // steps {
            //     script {
            //        sh docker.build("abhi_docker/sportsclub:latest")
            //     }
            // }
        
      //  stage('snyk Authentication') {
        //    steps { 
                // sh 'snyk config set 8e6e965d-98b5-4a16-af75-89d35e9618ac'
          //      sh 'snyk auth'
            //}
        //}
       
          stage('SnykScanning') {
                 steps {
                    // bat 'snyk config set snyk-api-abhijieet'
                     //bat 'snyk test abhi_patil/sportclub-backend:latest'
          //            // sh 'snyk test abhi_patil/sportclub-backend:latest',
                     snykSecurity snykInstallation: 'Snyk',
                     snykTokenId: 'snyk-api-abhijieet'
          //             // targetFile: 'Dockerfile'
          //            // One or more steps need to be included within the steps block.
          //            // snykSecurity snykInstallation: 'Snyk',
          //            // snykTokenId: 'snyk-api-abhijieet'
          //            // sh 'snyk test abhi_patil/sportclub-backend:latest'
                 }
             } 
        // stage('snykscan') {
        //    steps { 
        //        // sh 'snyk config set 8e6e965d-98b5-4a16-af75-89d35e9618ac'
        //        sh 'snyk test abhi_patil/sportclub-backend:latest'
        //     }
        // }

        // stage('Pushing Docker Image to Jfrog Artifactory') {
        //     when {
        //         branch 'release'
        //     }
        //     steps {
        //         script {
        //             docker.withRegistry('http://172.27.59.80:8082/', 'artifactory-docker') {
        //                 docker.image("abhi_docker/sportsclub:${TAG}").push()
        //                 docker.image("abhi_docker/sportsclub:${TAG}").push('latest')
        //             }
        //         }
        //     }
        // }
        // stage('Deploy'){
        //     when {
        //         branch 'release'
        //     }
        //     steps {
        //         sh 'docker-compose up'
        //     }
        // }
    }
}

/* groovylint-disable CompileStatic, DuplicateStringLiteral, LineLength, NestedBlockDepth, NglParseError */
pipeline {
    // environment {
    //     DATE = new Date().format('yy.M')
    //     TAG = "${DATE}.${BUILD_NUMBER}"
    // }
    agent {
        label 'linux'
    }
    tools {
            maven 'Maven'
            jdk 'JDK11'
    }

    stages {
        stage('validate') {
            steps {
                echo 'VALIDATE'
                sh 'mvn clean validate'
            }
        }
        stage('Compile') {
            steps {
                echo 'COMPILE'
                sh 'mvn clean compile'
            }
        }

        stage('test') {
            steps {
                echo 'Test'
                sh 'mvn clean test'
            }
        }

        // stage('Sonar Analysis') {
        //     steps {
        //         sh 'mvn clean install'
        //         sh 'mvn sonar:sonar -Dsonar.token=cbf4cb8304fee53bde54f1d6a2273f35b5afe9fd'
        //     }
        // }

        stage('package') {
            steps {
                echo 'Pakage'
                sh 'mvn clean package'
            }
        }
        stage('Docker Build') {
            // when {
            //     branch 'release'
            // }
            // stage('Build') {
                steps {
                    sh 'docker build -t abhi_patil/sportclub-backend:latest .'
                }
            // steps {
            //     script {
            //        sh docker.build("abhi_docker/sportsclub:latest")
            //     }
            // }
        }
        stage('snykscan') {
            steps { 
                sh 'snyk config set 200~8e6e965d-98b5-4a16-af75-89d35e9618ac'
                sh 'snyk test abhi_patil/sportclub-backend:latest'
            }
        }
         // stage('SnykScanning') {
         //        steps {
         //            // One or more steps need to be included within the steps block.
         //            snykSecurity snykInstallation: 'Snyk',
         //            snykTokenId: 'snyk-api-abhijieet'
         //        }
         //    }

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

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
       stage('Docker Build') {
           steps {
               sh 'docker build -t sportclub-backend:latest .'
           }
       }
       stage('SnykScanning') {
           steps {
               sh 'snyk auth ${SNYK_TOKEN}' 
               sh 'snyk container test sportclub-backend:latest --json | snyk-to-html -o results-sportclub.html'
           }
       }
       stage('Apply Custom CSS') {
            steps {
                script {
                    // Stash the custom CSS file
                    stash includes: 'custom.css', name: 'custom-css-file'
                     echo "Current workspace: ${env.WORKSPACE}"
                }
            }
        }
       stage('Copy CSS to Report Directory') {
            steps {
                script {
                    def reportDir = pwd() // Get the current workspace directory
                    def customCssDir = stash(name: 'custom-css-file')

                    // Copy the custom CSS file to the report directory
                    sh "cp ${/home/abhishekj/abhishek-node/workspace/abhijeethpatil/snyk-image-piplinejob-demo/custom.css /home/abhishekj/abhishek-node/workspace/abhijeethpatil}/custom.css ${reportDir}/custom.css"
                }
            }
        }
        
        stage('Update HTML Report') {
            steps {
                script {
                    // Assuming your_report.html references custom.css like this:
                    // <link rel="stylesheet" type="text/css" href="custom.css">
                    
                    // Read the report file
                    def reportPath = pwd() + '/results-sportclub.html'
                    def reportContent = readFile(reportPath)
                    
                    // Add a link to the custom CSS file
                    reportContent = reportContent.replace('</head>', '<link rel="stylesheet" type="text/css" href="custom.css"></head>')
                    
                    // Write the updated content back to the report file
                    writeFile(file: reportPath, text: reportContent)
                }
            }
        }
   }
}


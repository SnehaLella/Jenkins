pipeline{
    agent any 
	 
	 tools {  
	  maven 'Maven 3.6.0'  
	}
    
    stages{
	
        stage('scm clone'){
            steps{
            git branch: 'main', 
			credentialsId: 'SnehaLellasneha-9121806763', 
			url: 'https://github.com/SnehaLella/Jenkins.git'
            }
        }
        stage('build the code'){
            steps{
                sh "mvn clean package"
            }
        }
        stage('build image'){
            steps{
                sh "docker build . -t hello-world:${BUILD_NUMBER}"
            }
        }
        stage('login to ecr'){
           steps{
               script{
               sh "aws ecr get-login-password --region us-east-1 |docker login --username AWS --password-stdin 289987706411.dkr.ecr.us-east-1.amazonaws.com/jenkins:latest" 
               }
           }
       }
        stage('push to ecr'){
            steps{
                script{
                    sh "docker tag hello-world:${BUILD_NUMBER} 289987706411.dkr.ecr.us-east-1.amazonaws.com/jenkins:latest"
                    sh "docker push 289987706411.dkr.ecr.us-east-1.amazonaws.com/jenkins:latest "
                }
            }
        }
        
    }
}

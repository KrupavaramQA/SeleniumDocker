pipeline {
    // master executor should be set to 0
    agent any
	stages{
        stage('Build') {
            steps {
                //sh
                bat "mvn clean package -DskipTests"
            }
        }
        stage('BuildImage') {
            steps {
                //sh
                bat "docker build -t=kneerati12345/selenium-docker-exec ."
            }
        }
        stage('PushImage') {
            steps {
			    withCredentials([usernamePassword(credentialsId: 'krupadocker', passwordVariable: 'pass', usernameVariable: 'user')]) {
                    //sh
			        bat "docker login --username=${user} --password=${pass}"
			        bat "docker push vinsdocker/selenium-docker:latest"
			    }                           
            }
        }
    }
}
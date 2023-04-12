pipeline {
    agent any
    stages {
        stage('Check Java & Maven Version') {
            steps {
                sh 'java --version'
		echo "check Maven and Java Version "
		sh 'mvn --version'
            }
        }
	stage('clone git repo') {
	    steps {
		git branch: 'main', url: 'https://github.com/GoogleSearchBot/InsuranceProject.git'
	    }
        }
	stage('package the project') {
	     steps {
	    	sh 'mvn clean package'
	     }
	}
	stage('Publish HTML reports') {
	     steps {
		publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: '', reportFiles: 'index.html', reportName: 'HTML Report', reportTitles: '', useWrapperFileDirectly: true])
	     }
	}
	stage('build docker image') {
	     steps {
	    	sh 'docker build -t minimalkushal/insureme:latest .'
  	     }
	}
	stage('push image to docker hub') {
	     steps { 
		withCredentials([usernamePassword(credentialsId: 'docker-hub-login', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USER')]) {
    			sh "docker login -u ${env.DOCKERHUB_USER} --password-stdin"
			sh 'docker push minimalkushal/insureme:latest'
                }
	     }
	}
    }
}


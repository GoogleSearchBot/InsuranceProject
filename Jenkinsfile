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
    }
}


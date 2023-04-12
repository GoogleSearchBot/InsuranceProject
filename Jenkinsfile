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
    }
}


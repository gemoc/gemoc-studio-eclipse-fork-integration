
pipeline {
	agent any

    stages {
	    stage('Preparation') {
		    steps {	
				echo 'Content of the workspace'
				sh "pwd"
				sh "ls"
				sh "cat .gitmodules"
				sh "git submodule update --init"
				sh "chmod 777 ./gemoc-studio/dev_support/jenkins/showGitBranches.sh"
				sh "./gemoc-studio/dev_support/jenkins/showGitBranches.sh ."
			}
		}
	}
}
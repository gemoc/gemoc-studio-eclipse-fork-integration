
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
				// Get the Maven tool.
				// ** NOTE: This 'apache-maven-latest' Maven tool must be configured in the global configuration.
				// in order to find existing tools and their name, use the snippet generator available in the target jenkins instance (ie.  "Pipeline Syntax" link on the job)         
				mvnHome = tool 'apache-maven-latest'
			}
		}
	}
}
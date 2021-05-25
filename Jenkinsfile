
pipeline {
	agent any
    tools {
        maven 'apache-maven-latest'
        jdk 'open-jdk-11'
    }
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
				sh "wget https://gluonhq.com/download/javafx-11-0-2-sdk-linux  -O ${HOME}/javafx-11-0-2-sdk-linux.zip"
				sh "unzip ${HOME}/javafx-11-0-2-sdk-linux.zip -d ${HOME}"
				//JAVAFX_HOME=${HOME}/javafx-sdk-11.0.2
			}
		}
		stage('Build and unit test') {
			steps { 
				script {	
					def studioVariant
					if(  env.JENKINS_URL.contains("https://ci.eclipse.org/gemoc/")){
						studioVariant = "Official build"
					} else {
						studioVariant = "${JENKINS_URL}"
					}
					// Run the maven build and unit tests only  
					// maven requires some ram to build the update site and product
					withEnv(["STUDIO_VARIANT=${studioVariant}","BRANCH_VARIANT=${BRANCH_NAME}", "JAVAFX_HOME=${HOME}/javafx-sdk-11.0.2",
						"MAVEN_OPTS=-Xmx2000m -XshowSettings:vm"]){
						dir ('gemoc-studio/dev_support/full_compilation') {
							sh 'printenv'         
							sh "mvn -Dmaven.test.failure.ignore \"-Dstudio.variant=${studioVariant}\" -Dbranch.variant=${BRANCH_VARIANT} \
									-Djava.awt.headless=true \
									--projects !../../gemoc_studio/tests/org.eclipse.gemoc.studio.tests.system.lwb,!../../gemoc_studio/tests/org.eclipse.gemoc.studio.tests.system.mwb\
									clean install --errors --show-version"
						}      
					}
				}
			}
			post {
				always {
					junit '**/target/surefire-reports/TEST-*.xml' 
				}
			}
	 	}
	}
}
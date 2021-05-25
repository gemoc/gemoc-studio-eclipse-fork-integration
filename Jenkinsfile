#!groovy
node {
   properties([[$class: 'BuildDiscarderProperty', strategy: [$class: 'LogRotator', artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '', numToKeepStr: '5']]]);
   catchError {
	   def mvnHome
	   stage('Preparation') {
	   
	      echo 'Content of the workspace'
	      sh "ls"
	      sh "chmod 777 ./gemoc-studio/dev_support/jenkins/showGitBranches.sh"
	      sh "./gemoc-studio/dev_support/jenkins/showGitBranches.sh ."
	      sh "cat .gitmodules"
	      // Get the Maven tool.
	      // ** NOTE: This 'apache-maven-latest' Maven tool must be configured in the global configuration.
	      // in order to find existing tools and their name, use the snippet generator available in the target jenkins instance (ie.  "Pipeline Syntax" link on the job)         
	      mvnHome = tool 'apache-maven-latest'
	   }
	   stage('Build and verify') {
	      def studioVariant
	      if(  env.JENKINS_URL.contains("https://ci.eclipse.org/gemoc/")){
	      	studioVariant = "Official build"
	      } else {
	      	studioVariant = "${JENKINS_URL}"
	      }
	      // Run the maven build with tests  
	      withEnv(["STUDIO_VARIANT=${studioVariant}","BRANCH_VARIANT=${BRANCH_NAME}"]){ 
	          sh 'printenv'         
		      dir ('gemoc-studio/dev_support/full_compilation') {
		          wrap([$class: 'Xvnc', takeScreenshot: false, useXauthority: true]) {
		              // sh "'${mvnHome}/bin/mvn' -Dmaven.test.failure.ignore clean verify --errors "
		              sh "'${mvnHome}/bin/mvn' -Dmaven.test.failure.ignore \"-Dstudio.variant=${studioVariant}\" -Dbranch.variant=${BRANCH_VARIANT} clean verify --errors "
		          }
		      }      
	      }
	   }	   
	   stage('Deployment') {
	      junit '**/target/surefire-reports/TEST-*.xml'
	      archiveArtifacts '**/target/products/*.zip,**/gemoc-studio/gemoc_studio/releng/org.eclipse.gemoc.gemoc_studio.updatesite/target/repository/**'
	   }
   }
   step([$class: 'Mailer', notifyEveryUnstableBuild: true, recipients: '', sendToIndividuals: true])
}
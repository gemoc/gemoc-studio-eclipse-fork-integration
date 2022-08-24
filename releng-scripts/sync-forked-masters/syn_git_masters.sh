#!/bin/bash -xe

# this script will sync changes in github.com/eclipse/gemoc-studio#master  to github.com/gemoc/gemoc-studio-eclipsefork#master

# parameters: <upstream owner> <upstream repo> <fork owner> <fork repo>
function sync_github_repo_masters {
	echo "################"
	echo "#### merge changes of $1/$2 to $3/$4"
	echo "################"

	rm -rf $4
	
	git clone git@github.com:$3/$4.git
	cd $4

	git config --global push.default simple
	
	git remote -v
	git remote add upstream https://github.com/$1/$2.git
	git remote -v

	git fetch upstream
	git checkout master
	git merge --ff-only  upstream/master
	git push origin
	cd ..
	rm -rf $4
}

sync_github_repo_masters eclipse gemoc-studio gemoc gemoc-studio-eclipsefork

sync_github_repo_masters eclipse gemoc-studio-commons gemoc gemoc-studio-commons

sync_github_repo_masters eclipse gemoc-studio-modeldebugging gemoc gemoc-studio-modeldebugging-eclipsefork

sync_github_repo_masters eclipse gemoc-studio-execution-ale gemoc gemoc-studio-execution-ale-eclipsefork

sync_github_repo_masters eclipse gemoc-studio-execution-java gemoc gemoc-studio-execution-java

sync_github_repo_masters eclipse gemoc-studio-moccml gemoc gemoc-studio-moccml

sync_github_repo_masters eclipse gemoc-studio-execution-moccml gemoc gemoc-studio-execution-moccml

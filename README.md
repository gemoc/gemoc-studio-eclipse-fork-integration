# gemoc-studio-eclipse-fork-integration
Integration via git modules of GEMOC components in the GEMOC organization for use by continuous integration server

## CI Jobs

* **https://ci.inria.fr/gemoc/job/gemoc-studio-gemocforks-integration/** : CI Jobs for each branches

* https://ci.inria.fr/gemoc/job/git-sync-submodules-branches_gemoc-studio-eclipseforks-integration/ : job is in charge of synchronizing the branches for all known submodules (ie. create or remove branches if they exist in the submodules)

* https://ci.inria.fr/gemoc/job/sync_master_forked_repositories/ : job in charge of copying all changes from master branches of the origin repositories (in eclipse organisation ) to the gemoc organisation
 
# Maintenance tasks

## add a new submodule

```bash
git submodule add -b master https://github.com/gemoc/gemoc-studio-eclipsefork.git gemoc-studio
git submodule add -b master https://github.com/gemoc/gemoc-studio-modeldebugging-eclipsefork.git gemoc-studio-modeldebugging
git submodule add -b master https://github.com/gemoc/gemoc-studio-execution-ale-eclipsefork.git gemoc-studio-execution-ale
git submodule add -b master https://github.com/gemoc/gemoc-studio-execution-moccml.git gemoc-studio-execution-moccml
git submodule add -b master https://github.com/gemoc/gemoc-studio-moccml.git gemoc-studio-moccml
git submodule add -b master https://github.com/gemoc/gemoc-studio-execution-java.git gemoc-studio-execution-java
```

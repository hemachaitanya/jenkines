unit test: where code is return to test code (testing smaller unit of testing)

* static code analysis:  the code all will be okay or not

* quality gate:

 if will be fail the build when code quality issues exits this is called as quality gate.(code quality is failes then build will be faied)

* artifacts: it's what build/package generetes.

* repository: locaton where we store somthing. we will also have some version & history , we need to store the build artifacts of night build in artifacts repository.

* 

* check the code quality and regressions whenever developer comits the code

* manual testers will test all the work will done by developers previous day in todays works.

* Day build: developers are submitting there work(every change submitted by developers during active work hours)
    * we do minimal text  execution to
    * this should be finished quickly

* Night build:this build is done to considerate all the work done by dev team for the whole day 
    * we do execute all the automated tests
    * this might take hours and gives confidence to manual testing team so that consider this build .
    * 
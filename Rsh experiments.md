# Infrastructure

The codebase we work on is spread out across three repositories:
- Ř https://github.com/reactorlabs/rir. Main Ř repository.
- gnuR https://github.com/reactorlabs/gnur. GnuR implementation that is slightly modified to work with Ř.
- benchmarks  https://github.com/reactorlabs/RBenchmarking. Benchmarks suite

Ř repository refers to gnuR repository located at external/custom-r. It is referenced as a subrepository.
Ř repository sets up a CI gitlab pipeline supported by docker containers, which runs tests and executes benchmarks. Benchmarks repository is referred to in the file container/benchmark/Dockerfile.
Benchmarks are run using  benchmarking framework Rebench https://github.com/smarr/ReBench.git. 


# Performance experiments

Performance measurements are gathered by running te invocations of Ř on each benchmark. Within each invocation we measure the execution time of ti in-process invocations.

- On Ř repository, we consider this version to be our true baseline, without any kind of modification or instrumentation. https://github.com/reactorlabs/rir/tree/42258dd87ce0f6ea0e938d495efed03b56663e04

Code changes can be found here: https://github.com/reactorlabs/rir/compare/42258dd87ce0f6ea0e938d495efed03b56663e04...1a56370726981f5082b6445066d48e1c7d0db879
Changes include instrumentation and modifications for the paper itself, plus some other bug fixes not related to the current work that were, however, triggered by our changes.
Our modifications for the paper can be toggled by setting the environment variable INLINE_ALL_PROMS. 

Relevant changes to this work can be found in the following files: 
rir/src/ir/Compiler.cpp  (AST-to-RIR compiler) : The changes in this file are at the core of this work. Arguments to functions are not wrapped in promises when INLINE_ALL_PROMS=1. 
Some base library functions are excluded from this mechanism to preserve the appropriate semantics.

rir/src/api.cpp. Represents the interface between R and the compiler (C++ code). The changes found in this file provide access to the promises counter CREATED_PROMISES.   

-On gnuR repository, we consider this version to be our true baseline, without any kind of modification or instrumentation. https://github.com/reactorlabs/gnur/tree/b41208a5541905a6977bbc3c03b2bc4ba8c8d03c

Cade changes can be found here:  https://github.com/reactorlabs/gnur/compare/b41208a5541905a6977bbc3c03b2bc4ba8c8d03c...c20b7d4d7f0e36d15b10750b581aadfb0f0ad347 . 
Relevant changes can be found in file memory.c, where CREATED_PROMISES global counter gets incremented in the function mkPROMISE (R's C level function that creates promises). 

The following two experiments use gnuR and benchmarks repositories at versions:
gnu-r: https://github.com/reactorlabs/gnur/tree/c20b7d4d7f0e36d15b10750b581aadfb0f0ad347
benchmarks: https://github.com/reactorlabs/rbenchmarking/tree/88a76410dc70eeff8c9a0cbddaeb472a01510e4f

Each dataset for each experiment is downloaded from a performance dashboard (https://rir-benchmarks.prl.fit.cvut.cz) in a CSV format which, in turn, gets and transforms the artifact from the GitLab website.
Each CSV file contains te * ti lines per benchmark. Only rows worm=1 are considered (ie. we discard the first 5 in-process iterations). Note that dataset files in the paper only include information for the benchmarks subset already described.


TODO
- provide access to docker so that it is possible to modify build and  run code?

## Performance of base Ř vs. Ř strict

te=4,ti=25

This experiment shows a performance comparison between Ř and Ř strict.

The difference between Ř and Ř strict is that  'Ř strict' sets the flag INLINE_ALL_PROMS=1. 
See https://github.com/reactorlabs/rir/compare/ac583eacf191f91d1a82c54b0f38f15d148cacf9...1a56370726981f5082b6445066d48e1c7d0db879


### Ř baseline: 

Ř: https://github.com/reactorlabs/rir/tree/ac583eacf191f91d1a82c54b0f38f15d148cacf9
Gitlab: https://gitlab.com/rirvm/rir_mirror/-/jobs/1174869738
performance dashboard: https://rir-benchmarks.prl.fit.cvut.cz/job/1174869738.csv
Dataset from the paper: file 1174869738.


### Ř strict: 

Ř: https://github.com/reactorlabs/rir/tree/1a56370726981f5082b6445066d48e1c7d0db879
Gitlab: https://gitlab.com/rirvm/rir_mirror/-/jobs/1174881563
performance dashboard: https://rir-benchmarks.prl.fit.cvut.cz/job/1174881563.csv
Dataset from the paper: file 1174881563.


##  Performance of base Ř vs. Ř strict without optimizations

te=1,ti=15

This experiment shows the performance comparison between  Ř and Ř strict, without the optimizer. 
The experiment runs in the bc interpreter (RIR). JIT compiler is disabled.

Note the code for this experiment is almost the same as in the previous experiment. The main difference is that, additionally, the flag PIR_ENABLE is turned off (disables the JIT compiler).

See: https://github.com/reactorlabs/rir/commit/2872a79


### Ř baseline: 


Ř: https://github.com/reactorlabs/rir/tree/2872a799f6bcd14fe7a3270e86278d784d26020a
Gitlab: https://gitlab.com/rirvm/rir_mirror/-/jobs/1172663147
performance dashboard: https://rir-benchmarks.prl.fit.cvut.cz/job/1172663147.csv
Dataset from the paper: file 1172663147.


### Ř strict: 

Ř: https://github.com/reactorlabs/rir/tree/9c038edb3727233d45b5c6b8b94186451a0c9b6d
Gitlab: https://gitlab.com/rirvm/rir_mirror/-/jobs/1172677834
perf-dashboard: https://rir-benchmarks.prl.fit.cvut.cz/job/1172677834.csv
Dataset from the paper: file 1172677834.




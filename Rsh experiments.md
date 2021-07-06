# Performance experiments

te: number of invocations of Ř on each benchmark
ti: number of in-process invocations
Each csv file contains te * ti lines per benchmark. Only rows worm=1 are considered. 



On rir-repo, changes can be found here: https://github.com/reactorlabs/rir/compare/42258dd87ce0f6ea0e938d495efed03b56663e04...1a56370726981f5082b6445066d48e1c7d0db879
Changes include instrumentation and modifications for the paper itself, plus some other bug fixes not reltaed to the current work, but were however triggered by our changes.
The most relevant changes for this work can be found in the files: 
rir/src/ir/Compiler.cpp  (AST-to-RIR compiler) : The changes in this files are at the core of this work. Arguments to functions are not wrapped in promises when INLINE_ALL_PROMS=1. Some base library functions are excluded from this mechanism to preserve the appropiate semantics.
rir/src/api.cpp. Represents the interface between R and the compiler (C++ code). The changes found in this file provide access to the promises counter CREATED_PROMISES.   

On gnuR repo, changes can be found here:  https://github.com/reactorlabs/gnur/compare/b41208a5541905a6977bbc3c03b2bc4ba8c8d03c...c20b7d4d7f0e36d15b10750b581aadfb0f0ad347 . 
Most relevant changes are on file memory.c, where CREATED_PROMISES global counter is incremented within function mkPROMISE. 

Note that 'gnu-r' and 'benchmarks' versions are the same on both experiments.
gnu-r: https://github.com/reactorlabs/gnur/tree/c20b7d4d7f0e36d15b10750b581aadfb0f0ad347
benchmarks: https://github.com/reactorlabs/rbenchmarking/tree/88a76410dc70eeff8c9a0cbddaeb472a01510e4f


Baseline before changes: https://github.com/reactorlabs/rir/tree/42258dd87ce0f6ea0e938d495efed03b56663e04


TODO
-Describe all three repos , rir ,gnu-r, benchmarks. Explain how they refer to each other.
-Explain format  gitlab and csv
-describe rir/container/benchmark/Dockerfile


Note that dataset files in the paper only include information for the benchmarks subset already described.

## Performance of base Ř vs. Ř strict


te=4,ti=25

This experiment shows the comparison of performance on our benchmarks for the base version of Ř and Ř strict.

The difference between Ř baseline and Ř strict, is that  'Ř strict' sets the flag INLINE_ALL_PROMS=1. See https://github.com/reactorlabs/rir/compare/ac583eacf191f91d1a82c54b0f38f15d148cacf9...1a56370726981f5082b6445066d48e1c7d0db879


### Ř baseline: 

rir-repo: https://github.com/reactorlabs/rir/tree/ac583eacf191f91d1a82c54b0f38f15d148cacf9
gitlab: https://gitlab.com/rirvm/rir_mirror/-/jobs/1174869738
perf-dashboard: https://rir-benchmarks.prl.fit.cvut.cz/job/1174869738.csv
Dataset from the paper: file 1174869738.


### Ř strict: 

rir-repo: https://github.com/reactorlabs/rir/tree/1a56370726981f5082b6445066d48e1c7d0db879
gitlab: https://gitlab.com/rirvm/rir_mirror/-/jobs/1174881563
perf-dashboard: https://rir-benchmarks.prl.fit.cvut.cz/job/1174881563.csv
Dataset from the paper: file 1174881563.



##  Performance of base Ř vs. Ř strict without optimizations

te=1,ti=15

This experiment shows the comparison of performance on our benchmarks for the base version of Ř and Ř strict, without the optimizer. 
The experiment runs in the bc interpreter (RIR). JIT compiler is disabled.

Note the code for this experiment is almost the same as in the previous experiment. The main difference is that the flag PIR_ENABLE is turned off, which disables the JIT compiler.

See: https://github.com/reactorlabs/rir/commit/2872a79


### Ř baseline: 


rir-repo: https://github.com/reactorlabs/rir/tree/2872a799f6bcd14fe7a3270e86278d784d26020a
gitlab: https://gitlab.com/rirvm/rir_mirror/-/jobs/1172663147
perf-dashboard: https://rir-benchmarks.prl.fit.cvut.cz/job/1172663147.csv
Dataset from the paper: file 1172663147.


### Ř strict: 

rir-repo: https://github.com/reactorlabs/rir/tree/9c038edb3727233d45b5c6b8b94186451a0c9b6d
gitlab: https://gitlab.com/rirvm/rir_mirror/-/jobs/1172677834
perf-dashboard: https://rir-benchmarks.prl.fit.cvut.cz/job/1172677834.csv
Dataset from the paper: file 1172677834.




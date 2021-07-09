Artifacts for Section 5
=================


This document aims to provide the necessary artifacts to reproduce the experiments that generate the backing data for Figures 3,4,5 in the paper.
Artifacts are provided in the format of a docker image which already contains all the necessary resources to reproduce the experiments.
The overall idea is to, step by step, compile the source code and run each of the experiments that generate the datasets.
Once the docker image runs, the script *run.sh* is executed. Said script is included in the artifacts folder. Please see detailed comments in the script.
  

# Getting Started


Install docker if it is not installed


# Step by Step

Load the docker image provided in the artifacts folder and run it. Experiments 1,2,3 (as described in the script) will execute. Note that it might take several hours to complete (most likely between 8 to 10 hours depending on the host machine). Since experiments 1 and 2 measure performance, they are run in a dedicated benchmarking machine. Hence the absolute numbers obtained will differ from the ones presented in the paper. Experiment 3 counts the number of created promises in R. No particular benchmarking infrastructure is required and the numbers should match the ones in the paper.

Once the script completes, the control is returned to the bash shell within the container so that results can be verified.

The resulting graphs can be found at /paper/main.pdf

# Infrastructure

Next, we describe the overall code infrastructure and how it is mapped within the provided container.

The codebase we work on is spread out across three repositories:

- *Ř* https://github.com/reactorlabs/rir. Main Ř repository. It is located at /opt/rir/

- *gnuR* https://github.com/reactorlabs/gnur. GnuR implementation that is slightly modified to work with Ř. It is located at /opt/rir/external/custom-r.

- *rbenchmarks* https://github.com/reactorlabs/RBenchmarking. Benchmarks suite that is used to verified the overall performance of the compiler. It is located at /opt/rbenchmarking

  

*Ř* repository refers to *gnuR* repository and is referenced as a subrepository.
Benchmarks are run using benchmarking framework Rebench https://github.com/smarr/ReBench.git.


# Performance experiments
  

Performance experiments correspond to Figure 3 and Figure 4 in the paper.

Performance measurements are gathered by running *te* invocations of Ř on each benchmark. Within each invocation we measure the execution time of *ti* in-process invocations.

On ***Ř* repository**, we consider version *42258dd87ce0f6ea0e938d495efed03b56663e04* to be our true baseline, without any kind of modifications or instrumentation.

<!-- https://github.com/reactorlabs/rir/tree/42258dd87ce0f6ea0e938d495efed03b56663e04 -->

Code changes for this experiment include instrumentation and modifications for the paper itself, plus some other bug fixes not related to the current work that were, however, triggered by our changes.

Our modifications for the paper can be toggled by setting the environment variable INLINE_ALL_PROMS.

Relevant changes can be found in the following files:

- /opt/rir/rir/src/ir/Compiler.cpp (AST-to-RIR compiler) : The changes in this file are at the core of this work. Arguments to functions are not wrapped in promises when INLINE_ALL_PROMS=1. Some base library functions are excluded from this mechanism to preserve the appropriate semantics.

- /opt/rir/rir/src/api.cpp. Represents the interface between R and the compiler (C++ code). The changes found in this file provide access to the global variable CREATED_PROMISES (a counter that keeps track of the number of created promises).

  
On **gnuR repository**, we consider version *b41208a5541905a6977bbc3c03b2bc4ba8c8d03c* to be our true baseline, without any kind of modification or instrumentation.

<!-- https://github.com/reactorlabs/gnur/tree/b41208a5541905a6977bbc3c03b2bc4ba8c8d03c -->


Relevant changes can be found in file memory.c, where CREATED_PROMISES global counter gets incremented in the function mkPROMISE (R's C level function that creates promises).

The following two experiments use *gnuR* and *benchmarks* repositories at versions:

- gnu-r: c20b7d4d7f0e36d15b10750b581aadfb0f0ad347

- benchmarks: 88a76410dc70eeff8c9a0cbddaeb472a01510e4f

 
A benchmark execution outputs a dataset file that is stored at /paper/data/fileXX.data.
Each file contains *te* * *ti* lines per benchmark. Only rows *worm=1* are considered (ie. we discard the first 5 in-process iterations).


## Performance of base Ř vs. Ř strict (Experiment 1)


This experiment shows a performance comparison between Ř and Ř strict. Parameters: *te*=4,*ti*=25. Corresponds to Figure 3 in the paper.

The difference between Ř and Ř-strict is that 'Ř strict' sets the flag INLINE_ALL_PROMS=1.

<!-- See https://github.com/reactorlabs/rir/compare/ac583eacf191f91d1a82c54b0f38f15d148cacf9...1a56370726981f5082b6445066d48e1c7d0db879 -->


### Ř

Ř repository commit version: *ac583eacf191f91d1a82c54b0f38f15d148cacf9*
Dataset in the paper: /paper/data/1174869738.data

  

<!-- Ř https://github.com/reactorlabs/rir/tree/ac583eacf191f91d1a82c54b0f38f15d148cacf9

#Gitlab: https://gitlab.com/rirvm/rir_mirror/-/jobs/1174869738

#performance dashboard: https://rir-benchmarks.prl.fit.cvut.cz/job/1174869738.csv

#Dataset from the paper: file 1174869738. -->


### Ř-strict

  

Ř repository commit version: *1a56370726981f5082b6445066d48e1c7d0db879*
Dataset in the paper: /paper/data/1174881563.data

  
  

<!--

Ř: https://github.com/reactorlabs/rir/tree/1a56370726981f5082b6445066d48e1c7d0db879

Gitlab: https://gitlab.com/rirvm/rir_mirror/-/jobs/1174881563

performance dashboard: https://rir-benchmarks.prl.fit.cvut.cz/job/1174881563.csv

Dataset from the paper: file 1174881563. -->

  
  

## Performance of base Ř vs. Ř-strict without optimizations (Experiment 2)

Corresponds to Figure 4 in the paper. Parameters: *te*=1,*ti*=15. This experiment shows the performance comparison between Ř and Ř strict when the optimizer is disabled. The experiment runs in the bc interpreter (RIR).

Note the code for this experiment is almost the same as in the previous experiment. The main difference is that, additionally, the flag PIR_ENABLE is turned off (disables the JIT compiler).

<!--

See: https://github.com/reactorlabs/rir/commit/2872a79 -->


### Ř 

Ř repository commit version: *2872a799f6bcd14fe7a3270e86278d784d26020a*
Dataset in the paper: /paper/data/1172663147.data

  
<!--

Ř: https://github.com/reactorlabs/rir/tree/2872a799f6bcd14fe7a3270e86278d784d26020a

Gitlab: https://gitlab.com/rirvm/rir_mirror/-/jobs/1172663147

performance dashboard: https://rir-benchmarks.prl.fit.cvut.cz/job/1172663147.csv

Dataset from the paper: file 1172663147. -->

  

### Ř-strict:

Ř repository commit version: *9c038edb3727233d45b5c6b8b94186451a0c9b6d*
Dataset in the paper: /paper/data/1172677834.data

  

<!-- Ř: https://github.com/reactorlabs/rir/tree/9c038edb3727233d45b5c6b8b94186451a0c9b6d

Gitlab: https://gitlab.com/rirvm/rir_mirror/-/jobs/1172677834

perf-dashboard: https://rir-benchmarks.prl.fit.cvut.cz/job/1172677834.csv

Dataset from the paper: file 1172677834. -->

  
  

# Promise removal experiment

Corresponds to Figure 4 in the paper.
It compares the amount of created promises in GNUr vs Ř vs Ř-strict. A benchmark execution outputs a dataset file that is stored at /paper/data/

## GNUr
  
Notice that for computing this dataset we only instrumented and ran gnuR. Ř is not executed.

gnuR repository commit version: *c20b7d4*
Dataset in the paper: /paper/data/gnur-promises.csv


## Ř 

Ř repository commit version: *c3eb11c*
Dataset in the paper: /paper/data/rsh-promises.csv

  
## Ř-strict

Ř repository commit version: *c3eb11c*
Dataset in the paper: /paper/data/rsh-strict-promises.csv

# Results


After experiments are run, the graphs on the paper (located at /paper/) are built and, as a result, /paper/main.pdf file is created.
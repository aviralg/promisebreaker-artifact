#!/bin/sh


PAPER_FOLDER="/opt/paper/"
GRAPHS_DATA_FOLDER="/opt/paper/data"

ARTIFACTS_FOLDER="/opt/artifacts"
mkdir $ARTIFACTS_FOLDER

cp /opt/rbenchmarking/rebench.conf /opt/rbenchmarking/rebench.conf.back



# checkout benchmarks version for performance experiments (exp 1 and exp 2)
cd /opt/rbenchmarking/
git checkout 88a76410dc70eeff8c9a0cbddaeb472a01510e4f

#------------------  Experiment 1: PERFORMANCE -  Rsh vs Rsh-strict   -------------------------------------------------------------
# This experiment corresponds with Figure 3 in the paper
# Datasets: Rsh and Rsh-strict 

cp /opt/rbenchmarking/rebench.conf.back /opt/rbenchmarking/rebench.conf
# Set te=4 and ti=25
sed -i 's/invocations: 1/invocations: 4/' /opt/rbenchmarking/rebench.conf
sed -i 's/iterations: 15/iterations: 25/' /opt/rbenchmarking/rebench.conf

##### DEBUG ###
#sed -i 's/invocations: 1/invocations: 1/' /opt/rbenchmarking/rebench.conf
#sed -i 's/iterations: 15/iterations: 6/' /opt/rbenchmarking/rebench.conf
##########



# **** Rsh ***** 
cd /opt/rir/build/release
git checkout ac583eacf191f91d1a82c54b0f38f15d148cacf9
ninja 
#run benchmarks. Output:  1174869738.data
INLINE_ALL_PROMS=0 /opt/rbenchmarking/Setup/run.sh /opt/rbenchmarking/rebench.conf /opt/rbenchmarking/Benchmarks /opt/rir/build/release "e:PIR-LLVM -df $ARTIFACTS_FOLDER/1174869738.data -R"


# ***  Rsh strict ***
cd /opt/rir/build/release
git checkout 1a56370726981f5082b6445066d48e1c7d0db879
ninja
#run benchmarks. Output: 1174881563.data 
INLINE_ALL_PROMS=1 /opt/rbenchmarking/Setup/run.sh /opt/rbenchmarking/rebench.conf /opt/rbenchmarking/Benchmarks /opt/rir/build/release "e:PIR-LLVM -df $ARTIFACTS_FOLDER/1174881563.data -R"
# ----------------------------------------------------------------------------------------


# -------------------- Experiment 2:  PERFORMANCE - Rsh vs Rsh-strict NO OPTIMIZER -------------------------------------------------------------
# This experiment corresponds with Figure 4 in the paper
# Datasets: Rsh NOOPT and Rsh-strict NOOPT 


# default te=1 ti=15
cp /opt/rbenchmarking/rebench.conf.back /opt/rbenchmarking/rebench.conf

##### DEBUG ###
#sed -i 's/invocations: 1/invocations: 1/' /opt/rbenchmarking/rebench.conf
#sed -i 's/iterations: 15/iterations: 7/' /opt/rbenchmarking/rebench.conf
##########



# ***  Rsh NOOPT   *****

cd /opt/rir/build/release
git checkout 2872a799f6bcd14fe7a3270e86278d784d26020a
ninja 
#run benchmarks. Output: 1172663147.data
PIR_ENABLE=off INLINE_ALL_PROMS=0 /opt/rbenchmarking/Setup/run.sh /opt/rbenchmarking/rebench.conf /opt/rbenchmarking/Benchmarks /opt/rir/build/release "e:PIR-LLVM -df $ARTIFACTS_FOLDER/1172663147.data -R"


# ***  Rsh strict NOOPT *****
cd /opt/rir/build/release
git checkout 9c038edb3727233d45b5c6b8b94186451a0c9b6d
ninja
#run benchmarks. Output: 1172677834.data
PIR_ENABLE=off INLINE_ALL_PROMS=1 /opt/rbenchmarking/Setup/run.sh /opt/rbenchmarking/rebench.conf /opt/rbenchmarking/Benchmarks /opt/rir/build/release "e:PIR-LLVM -df $ARTIFACTS_FOLDER/1172677834.data -R"
# ----------------------------------------------------------------------------------------

rm $GRAPHS_DATA_FOLDER/*.data
# result from exp1 and exp2 is copied to paper's folder that is later compiled  
cp $ARTIFACTS_FOLDER/* $GRAPHS_DATA_FOLDER


#------------------ Experiment 3 - Promise allocations: Promises GNUR vs Rsh vs Rsh-strict  -------------------------------------------------------------
# This experiment corresponds with Figure 5 in the paper
# Datasets: GNUR / Rsh NOOPT / Rsh-strict NOOPT 

rm $GRAPHS_DATA_FOLDER/gnur-promises.csv
rm $GRAPHS_DATA_FOLDER/rsh-promises.csv
rm $GRAPHS_DATA_FOLDER/rsh-strict-promises.csv

# **** GNUR   *****
cd /opt/rir/external/custom-r/
git checkout c20b7d4
make

cd /opt/rbenchmarking
git checkout 5f34747fbfb53c0eabaa585a255b22bfd5cc567f
rm ~/dataPromises
# run experiment
Setup/run.sh rebench.conf Benchmarks/ /opt/rir/external/custom-r "e:PIR-LLVM -R"
# copy result to paper's folder
mv ~/dataPromises $GRAPHS_DATA_FOLDER/gnur-promises.csv

# ****  Rsh  ******* 
cd /opt/rir/
git checkout c3eb11c
git submodule update
cd /opt/rir/external/custom-r/
make
cd /opt/rir/build/release
ninja

cd /opt/rbenchmarking
git checkout acc582041eacdac00f1ca25059248df214dc68e6
rm ~/dataPromises
# run experiment
INLINE_ALL_PROMS=0 Setup/run.sh rebench.conf Benchmarks/ /opt/rir/build/release "e:PIR-LLVM -R"
# copy result to paper's folder
mv ~/dataPromises $GRAPHS_DATA_FOLDER/rsh-promises.csv


# **** Rsh strict   *****
cd /opt/rir/
git checkout c3eb11c
git submodule update
cd /opt/rir/external/custom-r/
make
cd /opt/rir/build/release
ninja

cd /opt/rbenchmarking
git checkout acc582041eacdac00f1ca25059248df214dc68e6
rm ~/dataPromises
# run experiment
INLINE_ALL_PROMS=1 Setup/run.sh rebench.conf Benchmarks/ /opt/rir/build/release "e:PIR-LLVM -R"
# copy result to paper's folder
mv ~/dataPromises $GRAPHS_DATA_FOLDER/rsh-strict-promises.csv


# ----------------------------------------------------------------------------------------

cd $PAPER_FOLDER
make performance
make # build paper to main.pdf

bash
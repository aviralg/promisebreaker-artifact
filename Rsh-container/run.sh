#!/bin/sh


PAPER_FOLDER="/opt/paper/"
GRAPHS_DATA_FOLDER="/opt/paper/data"

cp /opt/rbenchmarking/rebench.conf /opt/rbenchmarking/rebench.conf.back

ARTIFACTS_FOLDER="/opt/artifacts"
mkdir $ARTIFACTS_FOLDER

#------------------ Experiment 1:  Rsh vs Rsh-strict  -------------------------------------------------------------
cp /opt/rbenchmarking/rebench.conf.back /opt/rbenchmarking/rebench.conf
#  te=4 ti=25
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
INLINE_ALL_PROMS=0 /opt/rbenchmarking/Setup/run.sh /opt/rbenchmarking/rebench.conf /opt/rbenchmarking/Benchmarks /opt/rir/build/release "e:PIR-LLVM -df $ARTIFACTS_FOLDER/1174869738.data -R"


# ***  Rsh strict ***
cd /opt/rir/build/release
git checkout 1a56370726981f5082b6445066d48e1c7d0db879
ninja
INLINE_ALL_PROMS=1 /opt/rbenchmarking/Setup/run.sh /opt/rbenchmarking/rebench.conf /opt/rbenchmarking/Benchmarks /opt/rir/build/release "e:PIR-LLVM -df $ARTIFACTS_FOLDER/1174881563.data -R"
# ----------------------------------------------------------------------------------------


# --------------------Experiment 2:  Rsh vs Rsh-strict no optimizer -------------------------------------------------------------

# default te=1 ti=15
cp /opt/rbenchmarking/rebench.conf.back /opt/rbenchmarking/rebench.conf

##### DEBUG ###
#sed -i 's/invocations: 1/invocations: 1/' /opt/rbenchmarking/rebench.conf
#sed -i 's/iterations: 15/iterations: 7/' /opt/rbenchmarking/rebench.conf
##########



# ***  Rsh   *****

cd /opt/rir/build/release
git checkout 2872a799f6bcd14fe7a3270e86278d784d26020a
ninja 
PIR_ENABLE=off INLINE_ALL_PROMS=0 /opt/rbenchmarking/Setup/run.sh /opt/rbenchmarking/rebench.conf /opt/rbenchmarking/Benchmarks /opt/rir/build/release "e:PIR-LLVM -df $ARTIFACTS_FOLDER/1172663147.data -R"


# ***  Rsh strict *****
cd /opt/rir/build/release
git checkout 9c038edb3727233d45b5c6b8b94186451a0c9b6d
ninja
PIR_ENABLE=off INLINE_ALL_PROMS=1 /opt/rbenchmarking/Setup/run.sh /opt/rbenchmarking/rebench.conf /opt/rbenchmarking/Benchmarks /opt/rir/build/release "e:PIR-LLVM -df$ARTIFACTS_FOLDER/1172677834.data -R"
# ----------------------------------------------------------------------------------------

rm $GRAPHS_DATA_FOLDER/*.data
cp $ARTIFACTS_FOLDER/* $GRAPHS_DATA_FOLDER


#------------------ Experiment 3 - Promise allocations: Promises GNUR vs Rsh vs Rsh-strict  -------------------------------------------------------------

rm $GRAPHS_DATA_FOLDER/gnur-promises.csv
rm $GRAPHS_DATA_FOLDER/rsh-promises.csv
rm $GRAPHS_DATA_FOLDER/rsh-strict-promises.csv

# **** GNUR  *****
cd /opt/rir/external/custom-r/
git checkout c20b7d4
make

cd /opt/rbenchmarking
git fetch origin 5f34747fbfb53c0eabaa585a255b22bfd5cc567f
git checkout 5f34747fbfb53c0eabaa585a255b22bfd5cc567f
rm ~/datapPromises
Setup/run.sh rebench.conf Benchmarks/ /opt/rir/external/custom-r "e:PIR-LLVM -R"
mv ~/datapPromises $GRAPHS_DATA_FOLDER/gnur-promises.csv

# ****  Rsh ******* 
cd /opt/rir/
git checkout c3eb11c
git submodule update
cd /opt/rir/external/custom-r/
make
cd /opt/rir/build/release
ninja

cd /opt/rbenchmarking
git fetch origin acc582041eacdac00f1ca25059248df214dc68e6
git checkout acc582041eacdac00f1ca25059248df214dc68e6
rm ~/datapPromises
INLINE_ALL_PROMS=0 Setup/run.sh rebench.conf Benchmarks/ /opt/rir/build/release "e:PIR-LLVM -R"
mv ~/datapPromises $GRAPHS_DATA_FOLDER/rsh-promises.csv


# **** Rsh strict  *****
cd /opt/rir/
git checkout c3eb11c
git submodule update
cd /opt/rir/external/custom-r/
make
cd /opt/rir/build/release
ninja

cd /opt/rbenchmarking
git fetch origin acc582041eacdac00f1ca25059248df214dc68e6
git checkout acc582041eacdac00f1ca25059248df214dc68e6
rm ~/datapPromises
INLINE_ALL_PROMS=1 Setup/run.sh rebench.conf Benchmarks/ /opt/rir/build/release "e:PIR-LLVM -R"
mv ~/datapPromises $GRAPHS_DATA_FOLDER/rsh-strict-promises.csv


# ----------------------------------------------------------------------------------------

cd $PAPER_FOLDER
make performance
make # build paper to main.pdf

bash
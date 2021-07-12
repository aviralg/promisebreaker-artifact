################################################################################
## project base
## https://stackoverflow.com/questions/18136918/how-to-get-current-relative-directory-of-your-makefile
################################################################################
MAKEFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
PROJECT_DIRPATH := $(dir $(MAKEFILE_PATH))

################################################################################
## Parallelism
################################################################################
CPU_COUNT := 70

################################################################################
## Github
################################################################################
AVIRALG_GIT_URL := git@github.com:aviralg
PRL_PRG_GIT_URL := git@github.com:PRL-PRG

# logs
LOGS_DIRPATH := $(PROJECT_DIRPATH)/logs

# dependency
DEPENDENCY_DIRPATH := $(PROJECT_DIRPATH)/dependency
LOGS_DEPENDENCY_DIRPATH := $(LOGS_DIRPATH)/dependency

## dependency/dirpath
DOCKR_BRANCH := master
DOCKR_GIT_URL := $(AVIRALG_GIT_URL)/dockr.git
DEPENDENCY_DOCKR_DIRPATH := $(DEPENDENCY_DIRPATH)/dockr
LOGS_DEPENDENCY_DOCKR_DIRPATH := $(LOGS_DEPENDENCY_DIRPATH)/dockr/

## dependency/r-vanilla
R_VANILLA_BRANCH := r-4.0.2
R_VANILLA_GIT_URL := $(PRL_PRG_GIT_URL)/R-vanilla.git
DEPENDENCY_R_VANILLA_DIRPATH := $(DEPENDENCY_DIRPATH)/R-vanilla
LOGS_DEPENDENCY_R_VANILLA_DIRPATH := $(LOGS_DEPENDENCY_DIRPATH)/R-vanilla
R_VANILLA_BIN := $(DEPENDENCY_R_VANILLA_DIRPATH)/bin/R

## dependency/r-dyntrace
R_DYNTRACE_BRANCH := r-4.0.2
R_DYNTRACE_GIT_URL := $(PRL_PRG_GIT_URL)/R-dyntrace.git
DEPENDENCY_R_DYNTRACE_DIRPATH := $(DEPENDENCY_DIRPATH)/R-dyntrace
LOGS_DEPENDENCY_R_DYNTRACE_DIRPATH := $(LOGS_DEPENDENCY_DIRPATH)/R-dyntrace
R_DYNTRACE_BIN := $(DEPENDENCY_R_DYNTRACE_DIRPATH)/bin/R

## dependency/library
DEPENDENCY_LIBRARY_DIRPATH := $(DEPENDENCY_DIRPATH)/library
LOGS_DEPENDENCY_LIBRARY_DIRPATH := $(LOGS_DEPENDENCY_DIRPATH)/library

### dependency/library/mirror
DEPENDENCY_LIBRARY_MIRROR_DIRPATH := $(DEPENDENCY_LIBRARY_DIRPATH)/mirror
LOGS_DEPENDENCY_LIBRARY_MIRROR_DIRPATH := $(LOGS_DEPENDENCY_LIBRARY_DIRPATH)/mirror

#### dependency/library/mirror/cran
DEPENDENCY_LIBRARY_MIRROR_CRAN_DIRPATH := $(DEPENDENCY_LIBRARY_MIRROR_DIRPATH)/cran
LOGS_DEPENDENCY_LIBRARY_MIRROR_CRAN_DIRPATH := $(LOGS_DEPENDENCY_LIBRARY_MIRROR_DIRPATH)/cran

#### dependency/library/mirror/bioc
DEPENDENCY_LIBRARY_MIRROR_BIOC_DIRPATH := $(DEPENDENCY_LIBRARY_MIRROR_DIRPATH)/bioc
DEPENDENCY_LIBRARY_MIRROR_BIOC_RELEASE_DIRPATH := $(DEPENDENCY_LIBRARY_MIRROR_BIOC_DIRPATH)/release
LOGS_DEPENDENCY_LIBRARY_MIRROR_BIOC_DIRPATH := $(LOGS_DEPENDENCY_LIBRARY_MIRROR_DIRPATH)/bioc

### dependency/library/extract
DEPENDENCY_LIBRARY_EXTRACT_DIRPATH := $(DEPENDENCY_LIBRARY_DIRPATH)/extract
LOGS_DEPENDENCY_LIBRARY_EXTRACT_DIRPATH := $(LOGS_DEPENDENCY_LIBRARY_DIRPATH)/extract

### dependency/library/install
DEPENDENCY_LIBRARY_INSTALL_DIRPATH := $(DEPENDENCY_LIBRARY_DIRPATH)/install
LOGS_DEPENDENCY_LIBRARY_INSTALL_DIRPATH := $(LOGS_DEPENDENCY_LIBRARY_DIRPATH)/install

#### dependency/library/install/cran
LOGS_DEPENDENCY_LIBRARY_INSTALL_CRAN_DIRPATH := $(LOGS_DEPENDENCY_LIBRARY_INSTALL_DIRPATH)/cran

#### dependency/library/install/bioc
LOGS_DEPENDENCY_LIBRARY_INSTALL_BIOC_DIRPATH := $(LOGS_DEPENDENCY_LIBRARY_INSTALL_DIRPATH)/bioc

## dependency/instrumentr
INSTRUMENTR_BRANCH := c-api
INSTRUMENTR_GIT_URL := $(PRL_PRG_GIT_URL)/instrumentr.git
DEPENDENCY_INSTRUMENTR_DIRPATH := $(DEPENDENCY_DIRPATH)/instrumentr
LOGS_DEPENDENCY_INSTRUMENTR_DIRPATH := $(LOGS_DEPENDENCY_DIRPATH)/instrumentr

## dependency/experimentr
EXPERIMENTR_BRANCH := master
EXPERIMENTR_GIT_URL := $(AVIRALG_GIT_URL)/experimentr.git
DEPENDENCY_EXPERIMENTR_DIRPATH := $(DEPENDENCY_DIRPATH)/experimentr
LOGS_DEPENDENCY_EXPERIMENTR_DIRPATH := $(LOGS_DEPENDENCY_DIRPATH)/experimentr

## dependency/lazr
LAZR_BRANCH := master
LAZR_GIT_URL := $(AVIRALG_GIT_URL)/lazr.git
DEPENDENCY_LAZR_DIRPATH := $(DEPENDENCY_DIRPATH)/lazr
LOGS_DEPENDENCY_LAZR_DIRPATH := $(LOGS_DEPENDENCY_DIRPATH)/lazr

## dependency/strictr
STRICTR_BRANCH := master
STRICTR_GIT_URL := $(AVIRALG_GIT_URL)/strictr.git
DEPENDENCY_STRICTR_DIRPATH := $(DEPENDENCY_DIRPATH)/strictr
LOGS_DEPENDENCY_STRICTR_DIRPATH := $(LOGS_DEPENDENCY_DIRPATH)/strictr

# analysis
ANALYSIS_DIRPATH := $(PROJECT_DIRPATH)/analysis

# experiment
EXPERIMENT_DIRPATH := $(PROJECT_DIRPATH)/experiment

## experiment/corpus
EXPERIMENT_CORPUS_DIRPATH := $(EXPERIMENT_DIRPATH)/corpus
LOGS_CORPUS_DIRPATH := $(LOGS_DIRPATH)/corpus

### experiment/corpus/extract
EXPERIMENT_CORPUS_EXTRACT_DIRPATH := $(EXPERIMENT_CORPUS_DIRPATH)/extract
EXPERIMENT_CORPUS_EXTRACT_INDEX_FILEPATH := $(EXPERIMENT_CORPUS_EXTRACT_DIRPATH)/index.fst
EXPERIMENT_CORPUS_EXTRACT_PROGRAMS_DIRPATH := $(EXPERIMENT_CORPUS_EXTRACT_DIRPATH)/programs
LOGS_CORPUS_EXTRACT_DIRPATH := $(LOGS_CORPUS_DIRPATH)/extract

### experiment/corpus/sloc
EXPERIMENT_CORPUS_SLOC_DIRPATH := $(EXPERIMENT_CORPUS_DIRPATH)/sloc
LOGS_CORPUS_SLOC_DIRPATH := $(LOGS_CORPUS_DIRPATH)/sloc

#### experiment/corpus/sloc/corpus
EXPERIMENT_CORPUS_SLOC_CORPUS_DIRPATH := $(EXPERIMENT_CORPUS_SLOC_DIRPATH)/corpus
EXPERIMENT_CORPUS_SLOC_CORPUS_FILEPATH := $(EXPERIMENT_CORPUS_SLOC_CORPUS_DIRPATH)/sloc.fst
LOGS_CORPUS_SLOC_CORPUS_DIRPATH := $(LOGS_CORPUS_SLOC_DIRPATH)/corpus

#### experiment/corpus/sloc/corpus
EXPERIMENT_CORPUS_SLOC_PACKAGE_DIRPATH := $(EXPERIMENT_CORPUS_SLOC_DIRPATH)/package
EXPERIMENT_CORPUS_SLOC_PACKAGE_FILEPATH := $(EXPERIMENT_CORPUS_SLOC_PACKAGE_DIRPATH)/sloc.fst
LOGS_CORPUS_SLOC_PACKAGE_DIRPATH := $(LOGS_CORPUS_SLOC_DIRPATH)/package

### experiment/corpus/package
EXPERIMENT_CORPUS_PACKAGE_DIRPATH := $(EXPERIMENT_CORPUS_DIRPATH)/package
EXPERIMENT_CORPUS_PACKAGE_INFO_FILEPATH := $(EXPERIMENT_CORPUS_PACKAGE_DIRPATH)/info.fst
LOGS_CORPUS_PACKAGE_DIRPATH := $(LOGS_CORPUS_DIRPATH)/package

## experiment/profile
EXPERIMENT_PROFILE_DIRPATH := $(EXPERIMENT_DIRPATH)/profile
LOGS_PROFILE_DIRPATH := $(LOGS_DIRPATH)/profile

### experiment/profile/trace
EXPERIMENT_PROFILE_TRACE_DIRPATH := $(EXPERIMENT_PROFILE_DIRPATH)/trace

EXPERIMENT_PROFILE_TRACE_PROGRAMS_DIRPATH := $(EXPERIMENT_PROFILE_TRACE_DIRPATH)/programs
EXPERIMENT_PROFILE_TRACE_PROGRAMS_JOBLOG_FILEPATH := $(EXPERIMENT_PROFILE_TRACE_PROGRAMS_DIRPATH)/trace-joblog

EXPERIMENT_PROFILE_TRACE_INDEX_DIRPATH := $(EXPERIMENT_PROFILE_TRACE_DIRPATH)/index
EXPERIMENT_PROFILE_TRACE_INDEX_PROGRAMS_FILEPATH = $(EXPERIMENT_PROFILE_TRACE_INDEX_DIRPATH)/programs
EXPERIMENT_PROFILE_TRACE_INDEX_OUTDIR_FILEPATH = $(EXPERIMENT_PROFILE_TRACE_INDEX_DIRPATH)/outdir
EXPERIMENT_PROFILE_TRACE_INDEX_LOGDIR_FILEPATH = $(EXPERIMENT_PROFILE_TRACE_INDEX_DIRPATH)/logdir
CORPUS_FILENAME = corpus-small
EXPERIMENT_PROFILE_TRACE_INDEX_CORPUS_FILEPATH = $(EXPERIMENT_PROFILE_TRACE_INDEX_DIRPATH)/$(CORPUS_FILENAME)

LOGS_PROFILE_TRACE_DIRPATH := $(LOGS_PROFILE_DIRPATH)/trace

### experiment/profile/reduce
ANALYSIS := signature
ANALYSIS_PROFILE_SCRIPT := $(ANALYSIS_DIRPATH)/profile.R
EXPERIMENT_PROFILE_REDUCE_PROGRAMS_JOBLOG_FILEPATH := $(EXPERIMENT_PROFILE_TRACE_PROGRAMS_DIRPATH)/reduce-joblog

### experiment/profile/combine
EXPERIMENT_PROFILE_COMBINE_DIRPATH := $(EXPERIMENT_PROFILE_DIRPATH)/combine

### experiment/profile/summarize
EXPERIMENT_PROFILE_SUMMARIZE_DIRPATH := $(EXPERIMENT_PROFILE_DIRPATH)/summarize

### experiment/profile/signature
ANALYSIS_SIGNATURE_SCRIPT := $(ANALYSIS_DIRPATH)/signature.R
EXPERIMENT_PROFILE_SIGNATURE_DIRPATH := $(EXPERIMENT_PROFILE_DIRPATH)/signature

## experiment/validate
SIGNATURE := signature+force+effect+reflection
EXPERIMENT_VALIDATE_DIRPATH := $(EXPERIMENT_DIRPATH)/validate
LOGS_VALIDATE_DIRPATH := $(LOGS_DIRPATH)/validate

### experiment/validate/trace
EXPERIMENT_VALIDATE_TRACE_DIRPATH := $(EXPERIMENT_VALIDATE_DIRPATH)/trace

EXPERIMENT_VALIDATE_TRACE_PROGRAMS_DIRPATH := $(EXPERIMENT_VALIDATE_TRACE_DIRPATH)/programs
EXPERIMENT_VALIDATE_TRACE_PROGRAMS_JOBLOG_DIRPATH := $(EXPERIMENT_VALIDATE_TRACE_PROGRAMS_DIRPATH)/joblog

EXPERIMENT_VALIDATE_TRACE_INDEX_DIRPATH := $(EXPERIMENT_VALIDATE_TRACE_DIRPATH)/index
EXPERIMENT_VALIDATE_TRACE_INDEX_PROGRAMS_FILEPATH = $(EXPERIMENT_VALIDATE_TRACE_INDEX_DIRPATH)/programs
EXPERIMENT_VALIDATE_TRACE_INDEX_OUTDIR_FILEPATH = $(EXPERIMENT_VALIDATE_TRACE_INDEX_DIRPATH)/outdir
EXPERIMENT_VALIDATE_TRACE_INDEX_LOGDIR_FILEPATH = $(EXPERIMENT_VALIDATE_TRACE_INDEX_DIRPATH)/logdir
EXPERIMENT_VALIDATE_TRACE_INDEX_CORPUS_FILEPATH = $(EXPERIMENT_VALIDATE_TRACE_INDEX_DIRPATH)/corpus
CLIENT_FILENAME = client-small
EXPERIMENT_VALIDATE_TRACE_INDEX_CLIENT_FILEPATH = $(EXPERIMENT_VALIDATE_TRACE_INDEX_DIRPATH)/$(CLIENT_FILENAME)

LOGS_VALIDATE_TRACE_DIRPATH := $(LOGS_VALIDATE_DIRPATH)/trace
ANALYSIS_VALIDATE_SCRIPT := $(ANALYSIS_DIRPATH)/validate.R

TYPE := example
PACKAGE := ACNE
FILENAME := fitSnpNmfArray

## experiment/validate/summary
EXPERIMENT_VALIDATE_SUMMARY_DIRPATH := $(EXPERIMENT_VALIDATE_DIRPATH)/summary

## experiment/report
EXPERIMENT_REPORT_DIRPATH := $(EXPERIMENT_DIRPATH)/report
LOGS_REPORT_DIRPATH := $(LOGS_DIRPATH)/report

## experiment/report/paper
PAPER_BRANCH := master
PAPER_GIT_URL := $(AVIRALG_GIT_URL)/promisebreaker-paper.git
EXPERIMENT_REPORT_PAPER_DIRPATH := $(EXPERIMENT_REPORT_DIRPATH)/paper
LOGS_REPORT_PAPER_DIRPATH := $(LOGS_REPORT_DIRPATH)/paper

## experiment/report/input
EXPERIMENT_REPORT_PAPER_DATA_DIRPATH := $(EXPERIMENT_REPORT_PAPER_DIRPATH)/data
LOGS_REPORT_INPUT_DIRPATH := $(LOGS_REPORT_DIRPATH)/input

## experiment/report/update
LOGS_REPORT_UPDATE_DIRPATH := $(LOGS_REPORT_DIRPATH)/update

## experiment/report/render
LOGS_REPORT_RENDER_DIRPATH := $(LOGS_REPORT_DIRPATH)/render

PACKAGE_LIST := installed.packages()[,1]

################################################################################
## parallel args
################################################################################
TIMEOUT := 7200
PARALLEL_ARGS := --bar --eta --timeout $(TIMEOUT) --wd ... --jobs=$(CPU_COUNT) --files

################################################################################
## docker build args
################################################################################
#PORT := 5000:80
USER := $(USER)
UID := $(shell id -u)
GID := $(shell id -g)
PASSWORD := $(USER)
R_LIBS_USER := $(DEPENDENCY_LIBRARY_INSTALL_DIRPATH)

R_DYNTRACE := $(PROJECT_DIRPATH)/../R-dyntrace/bin/R
DOCKR_RUN_ARGS := -t --env="DISPLAY" --volume="/tmp/.X11-unix:/tmp/.X11-unix" --cap-add=SYS_PTRACE --security-opt seccomp=unconfined --privileged -v $(PROJECT_DIRPATH):$(PROJECT_DIRPATH) #--publish=$(PORT)

################################################################################
## Applications
################################################################################
TEE := tee
TEE_FLAGS := -i
TIME := time --portability
XVFB_RUN := xvfb-run
MV := mv
RM := rm
PARALLEL := parallel

DATE := TZ='America/New_York' date +"%Y-%b-%d %I:%M:%S %p"
################################################################################
## package setup options
################################################################################
CRAN_MIRROR_URL := "https://cran.r-project.org"
PACKAGE_SETUP_REPOSITORIES := --setup-cran --setup-bioc
PACKAGE_SETUP_NCPUS := 8
PACKAGE_SETUP_DIRPATH := $(PROJECT_DIRPATH)packages
PACKAGE_LIB_DIRPATH := $(PACKAGE_SETUP_DIRPATH)/lib
PACKAGE_MIRROR_DIRPATH := $(PACKAGE_SETUP_DIRPATH)/mirror
PACKAGE_SRC_DIRPATH := $(PACKAGE_SETUP_DIRPATH)/src
PACKAGE_TEST_DIRPATH := $(PACKAGE_SETUP_DIRPATH)/tests
PACKAGE_EXAMPLE_DIRPATH := $(PACKAGE_SETUP_DIRPATH)/examples
PACKAGE_VIGNETTE_DIRPATH := $(PACKAGE_SETUP_DIRPATH)/doc
PACKAGE_LOG_DIRPATH := $(PACKAGE_SETUP_DIRPATH)/log

################################################################################
## corpus
################################################################################
CORPUS_DIRPATH := $(PROJECT_DIRPATH)corpus
CORPUS_INDEX_DIRPATH := $(CORPUS_DIRPATH)/index
CORPUS_DATA_DIRPATH := $(CORPUS_DIRPATH)/data
CORPUS_LOGS_DIRPATH := $(CORPUS_DIRPATH)/logs
CORPUS_INDEX_ALL_FILEPATH := $(CORPUS_INDEX_DIRPATH)/all.fst
CORPUS_DATA_ALL_DIRPATH := $(CORPUS_DATA_DIRPATH)/all

define newline


endef

define run_rdyntrace
$(R_DYNTRACE_BIN) -e ${1} 2>&1 | $(TEE) $(TEE_FLAGS) ${2}
endef


install-packages:
	$(R_DYNTRACE_BIN) --file=packages.R

experiment-corpus: experiment-corpus-extract       \
                   experiment-corpus-sloc          \
                   experiment-corpus-package       \
                   experiment-corpus-deterministic

define CODE_EXTRACT_CODE
library(experimentr);
res <- extract_code($(PACKAGE_LIST),
                    type=c('example', 'vignette', 'testthat', 'test'),
                    index_filepath='$(EXPERIMENT_CORPUS_EXTRACT_INDEX_FILEPATH)',
                    data_dirpath='$(EXPERIMENT_CORPUS_EXTRACT_PROGRAMS_DIRPATH)');
endef


################################################################################
## experiment/corpus/extract
################################################################################

experiment-corpus-extract:
	mkdir -p $(EXPERIMENT_CORPUS_EXTRACT_DIRPATH)
	$(RM) -rf $(EXPERIMENT_CORPUS_EXTRACT_PROGRAMS_DIRPATH) && mkdir -p $(EXPERIMENT_CORPUS_EXTRACT_PROGRAMS_DIRPATH)
	mkdir -p $(LOGS_CORPUS_EXTRACT_DIRPATH)
	$(call run_rdyntrace, "$(subst $(newline), ,$(CODE_EXTRACT_CODE))", $(LOGS_CORPUS_EXTRACT_DIRPATH)/extract.log)


define EXPERIMENT_PROFILE_TRACE_INDEX_CODE
library(experimentr);
invisible(tracing_index('$(EXPERIMENT_CORPUS_EXTRACT_INDEX_FILEPATH)', '$(EXPERIMENT_CORPUS_EXTRACT_PROGRAMS_DIRPATH)', '$(EXPERIMENT_PROFILE_TRACE_PROGRAMS_DIRPATH)', '$(EXPERIMENT_PROFILE_TRACE_INDEX_PROGRAMS_FILEPATH)', '$(EXPERIMENT_PROFILE_TRACE_INDEX_LOGDIR_FILEPATH)',
                          packages = readr::read_lines('$(EXPERIMENT_PROFILE_TRACE_INDEX_CORPUS_FILEPATH)'),
                          test_wrapper = 'library(lazr)\ntrace <- trace_expr({{\n{code}\n}})\nlibrary(experimentr)\nwrite_trace(trace, \'{outdir}\')',
                          testthat_wrapper = 'library(lazr)\ntrace <- trace_expr(testthat::test_file(\'{file}\', package=\'{package}\'))\nlibrary(experimentr)\nwrite_trace(trace, \'{outdir}\')',
                          example_wrapper = 'library(lazr)\ntrace <- trace_expr({{\n{code}\n}})\nlibrary(experimentr)\nwrite_trace(trace, \'{outdir}\')',
                          vignette_wrapper = 'library(lazr)\ntrace <- trace_expr({{\n{code}\n}})\nlibrary(experimentr)\nwrite_trace(trace, \'{outdir}\')'));
endef

extract-corpus:
	mkdir -p $(EXPERIMENT_PROFILE_TRACE_INDEX_DIRPATH)
	mkdir -p $(EXPERIMENT_PROFILE_TRACE_PROGRAMS_DIRPATH)
	mkdir -p $(LOGS_PROFILE_TRACE_DIRPATH)
	$(call run_rdyntrace, "$(subst $(newline), ,$(EXPERIMENT_PROFILE_TRACE_INDEX_CODE))", $(EXPERIMENT_PROFILE_TRACE_INDEX_DIRPATH)/log)

trace-corpus:
	mkdir -p $(EXPERIMENT_PROFILE_TRACE_PROGRAMS_DIRPATH)
	-$(PARALLEL) --joblog $(EXPERIMENT_PROFILE_TRACE_PROGRAMS_JOBLOG_FILEPATH)  $(PARALLEL_ARGS) --results {1}/ $(R_DYNTRACE_BIN) --file={1}/program.R :::: $(EXPERIMENT_PROFILE_TRACE_INDEX_LOGDIR_FILEPATH)

experiment-profile-reduce:
	$(shell find $(EXPERIMENT_PROFILE_TRACE_PROGRAMS_DIRPATH) -mindepth 3 -maxdepth 3 -type d > $(EXPERIMENT_PROFILE_TRACE_INDEX_DIRPATH)/reduce-index)
	$(PARALLEL) --joblog $(EXPERIMENT_PROFILE_REDUCE_PROGRAMS_JOBLOG_FILEPATH) $(PARALLEL_ARGS) --results {1}/reduce/ $(R_VANILLA_BIN) --file=$(ANALYSIS_PROFILE_SCRIPT) --args reduce {1} {1}/reduce $(ANALYSIS) :::: $(EXPERIMENT_PROFILE_TRACE_INDEX_DIRPATH)/reduce-index

experiment-profile-combine:
	mkdir -p $(EXPERIMENT_PROFILE_COMBINE_DIRPATH)
	$(R_VANILLA_BIN) --slave --file=$(ANALYSIS_PROFILE_SCRIPT) --slave --args combine $(EXPERIMENT_PROFILE_TRACE_PROGRAMS_DIRPATH) $(EXPERIMENT_PROFILE_COMBINE_DIRPATH) $(ANALYSIS) 2>&1 | $(TEE) $(TEE_FLAGS) $(EXPERIMENT_PROFILE_COMBINE_DIRPATH)/log

experiment-profile-summarize:
	mkdir -p $(EXPERIMENT_PROFILE_SUMMARIZE_DIRPATH)
	$(R_VANILLA_BIN) --slave --file=$(ANALYSIS_PROFILE_SCRIPT) --slave --args summarize $(EXPERIMENT_PROFILE_COMBINE_DIRPATH) $(EXPERIMENT_PROFILE_SUMMARIZE_DIRPATH) $(ANALYSIS) 2>&1 | $(TEE) $(TEE_FLAGS) $(EXPERIMENT_PROFILE_SUMMARIZE_DIRPATH)/log

reduce-all:
	-make experiment-profile-reduce ANALYSIS=unevaluated
	-make experiment-profile-reduce ANALYSIS=arguments
	-make experiment-profile-reduce ANALYSIS=functions
	-make experiment-profile-reduce ANALYSIS=reflection
	-make experiment-profile-reduce ANALYSIS=effects
	-make experiment-profile-reduce ANALYSIS=direct_effects
	-make experiment-profile-reduce ANALYSIS=statistics
	-make experiment-profile-reduce ANALYSIS=argument_type
	-make experiment-profile-reduce ANALYSIS=indirect_effects
	-make experiment-profile-reduce ANALYSIS=metaprogramming

combine-all:
	make experiment-profile-combine ANALYSIS=allocation.fst
	make experiment-profile-combine ANALYSIS=arg_ref.fst
	make experiment-profile-combine ANALYSIS=arguments.fst
	make experiment-profile-combine ANALYSIS=argument_type.fst
	make experiment-profile-combine ANALYSIS=direct_effects.fst
	make experiment-profile-combine ANALYSIS=effects.fst
	make experiment-profile-combine ANALYSIS=execution.fst
	make experiment-profile-combine ANALYSIS=functions.fst
	make experiment-profile-combine ANALYSIS=indirect_effects.fst
	make experiment-profile-combine ANALYSIS=metaprogramming.fst

summarize-all:
	make experiment-profile-summarize ANALYSIS=unevaluated
	make experiment-profile-summarize ANALYSIS=arguments
	make experiment-profile-summarize ANALYSIS=functions
	make experiment-profile-summarize ANALYSIS=reflection
	make experiment-profile-summarize ANALYSIS=effects
	make experiment-profile-summarize ANALYSIS=direct_effects
	make experiment-profile-summarize ANALYSIS=statistics
	make experiment-profile-summarize ANALYSIS=argument_type
	make experiment-profile-summarize ANALYSIS=indirect_effects
	make experiment-profile-summarize ANALYSIS=metaprogramming

compute-signatures:
	mkdir -p $(EXPERIMENT_PROFILE_SIGNATURE_DIRPATH)
	$(R_VANILLA_BIN) --slave --file=$(ANALYSIS_SIGNATURE_SCRIPT) --args $(EXPERIMENT_PROFILE_SUMMARIZE_DIRPATH)/parameters.fst $(EXPERIMENT_PROFILE_TRACE_INDEX_CORPUS_FILEPATH) $(EXPERIMENT_PROFILE_SIGNATURE_DIRPATH)

synthesize-signatures: extract-corpus trace-corpus reduce-all combine-all summarize-all compute-signatures

install-signatures:
	rm -rf dependency/strictr/inst/signatures/*
	cp -r $(EXPERIMENT_PROFILE_SIGNATURE_DIRPATH)/* dependency/strictr/inst/signatures
	cd dependency/strictr/ && make R=../R-dyntrace/bin/R

################################################################################
## Experiment: Validate
################################################################################

define EXPERIMENT_VALIDATE_TRACE_INDEX_CODE
library(experimentr);
invisible(tracing_index('$(EXPERIMENT_CORPUS_EXTRACT_INDEX_FILEPATH)', '$(EXPERIMENT_CORPUS_EXTRACT_PROGRAMS_DIRPATH)', '$(EXPERIMENT_VALIDATE_TRACE_PROGRAMS_DIRPATH)', '$(EXPERIMENT_VALIDATE_TRACE_INDEX_PROGRAMS_FILEPATH)', '$(EXPERIMENT_VALIDATE_TRACE_INDEX_LOGDIR_FILEPATH)',
                          packages = readr::read_lines('$(EXPERIMENT_VALIDATE_TRACE_INDEX_CLIENT_FILEPATH)'),
                          test_wrapper = 'strictr::initialize_strictr(commandArgs(trailingOnly=TRUE)[[1]], commandArgs(trailingOnly=TRUE)[[2]])\n{code}\nstrictr::finalize_strictr(commandArgs(trailingOnly=TRUE)[[1]], commandArgs(trailingOnly=TRUE)[[2]], fst::write_fst)',
                          testthat_wrapper = 'strictr::initialize_strictr(commandArgs(trailingOnly=TRUE)[[1]], commandArgs(trailingOnly=TRUE)[[2]])\ntestthat::test_file(\'{file}\', package=\'{package}\')\nstrictr::finalize_strictr(commandArgs(trailingOnly=TRUE)[[1]], commandArgs(trailingOnly=TRUE)[[2]], fst::write_fst)',
                          example_wrapper = 'strictr::initialize_strictr(commandArgs(trailingOnly=TRUE)[[1]], commandArgs(trailingOnly=TRUE)[[2]])\n{code}\nstrictr::finalize_strictr(commandArgs(trailingOnly=TRUE)[[1]], commandArgs(trailingOnly=TRUE)[[2]], fst::write_fst)',
                          vignette_wrapper = 'strictr::initialize_strictr(commandArgs(trailingOnly=TRUE)[[1]], commandArgs(trailingOnly=TRUE)[[2]])\n{code}\nstrictr::finalize_strictr(commandArgs(trailingOnly=TRUE)[[1]], commandArgs(trailingOnly=TRUE)[[2]], fst::write_fst)'));
endef

extract-clients:
	mkdir -p $(EXPERIMENT_VALIDATE_TRACE_INDEX_DIRPATH)
	mkdir -p $(EXPERIMENT_VALIDATE_TRACE_PROGRAMS_DIRPATH)
	mkdir -p $(LOGS_VALIDATE_TRACE_DIRPATH)
	$(R_VANILLA_BIN) -e "$(subst $(newline), ,$(EXPERIMENT_VALIDATE_TRACE_INDEX_CODE))" 2>&1 | $(TEE) $(TEE_FLAGS) $(EXPERIMENT_VALIDATE_TRACE_INDEX_DIRPATH)/log

trace-clients-one:
	mkdir -p $(EXPERIMENT_VALIDATE_TRACE_PROGRAMS_DIRPATH)
	mkdir -p $(EXPERIMENT_VALIDATE_TRACE_PROGRAMS_JOBLOG_DIRPATH)
	parallel --joblog $(EXPERIMENT_VALIDATE_TRACE_PROGRAMS_JOBLOG_DIRPATH)/$(SIGNATURE)  $(PARALLEL_ARGS) --results {1}/$(SIGNATURE)/ $(R_VANILLA_BIN) --slave --file={1}/program.R --args {1} $(SIGNATURE) "2>&1" :::: $(EXPERIMENT_VALIDATE_TRACE_INDEX_LOGDIR_FILEPATH)

trace-clients:
	-make trace-clients-one SIGNATURE=lazy-1
	-make trace-clients-one SIGNATURE=lazy-2
	-make trace-clients-one SIGNATURE=signature+force+effect+reflection
	-make trace-clients-one SIGNATURE=signature+force+effect-reflection
	-make trace-clients-one SIGNATURE=signature+force-effect+reflection
	-make trace-clients-one SIGNATURE=signature+force-effect-reflection
	-make trace-clients-one SIGNATURE=signature-force+effect+reflection
	-make trace-clients-one SIGNATURE=signature-force+effect-reflection
	-make trace-clients-one SIGNATURE=signature-force-effect+reflection
	-make trace-clients-one SIGNATURE=signature-force-effect-reflection

summarize-validation:
	mkdir -p $(EXPERIMENT_VALIDATE_SUMMARY_DIRPATH)
	$(R_VANILLA_BIN) --file=$(ANALYSIS_VALIDATE_SCRIPT) --args $(EXPERIMENT_VALIDATE_TRACE_PROGRAMS_DIRPATH) $(EXPERIMENT_VALIDATE_TRACE_PROGRAMS_JOBLOG_DIRPATH) $(EXPERIMENT_VALIDATE_SUMMARY_DIRPATH)

validate-signatures: extract-clients trace-clients summarize-validation

report-results:
	cp -r $(EXPERIMENT_PROFILE_SUMMARIZE_DIRPATH)/* paper/data
	cp -r $(EXPERIMENT_VALIDATE_SUMMARY_DIRPATH)/* paper/data/
	cp $(EXPERIMENT_PROFILE_TRACE_INDEX_CORPUS_FILEPATH) paper/data/corpus
	cp $(EXPERIMENT_VALIDATE_TRACE_INDEX_CLIENT_FILEPATH) paper/data/client
	cd paper && make R=$(R_VANILLA_BIN) unevaluated
	cd paper && make R=$(R_VANILLA_BIN) side-effects
	cd paper && make R=$(R_VANILLA_BIN) reflection
	cd paper && make R=$(R_VANILLA_BIN) validation
	cd paper && make R=$(R_VANILLA_BIN) statistics
	cd paper && make R=$(R_VANILLA_BIN) metaprogramming
	sudo cp -r paper/*.html /var/www/

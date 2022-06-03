set(CMAKE_C_COMPILER ${PGO_STAGE_1_INSTALL_PATH}/bin/clang CACHE STRING "")
set(CMAKE_CXX_COMPILER ${PGO_STAGE_1_INSTALL_PATH}/bin/clang++ CACHE STRING "")
set(CMAKE_BUILD_TYPE RELEASE CACHE STRING "")
set(CLANG_ENABLE_BOOTSTRAP ON CACHE BOOL "")

set(CMAKE_INSTALL_PREFIX ${PGO_STAGE_2_INSTALL_PATH} CACHE STRING "")

set(LLVM_ENABLE_PROJECTS clang;clang-tools-extra;compiler-rt;llvm CACHE STRING "")
set(LLVM_ENABLE_RUNTIMES compiler-rt;libcxx;libcxxabi CACHE STRING "")
set(LLVM_BUILD_EXTERNAL_COMPILER_RT ON CACHE BOOL "")

set(LLVM_TARGETS_TO_BUILD Native CACHE STRING "")
set(BOOTSTRAP_LLVM_BUILD_INSTRUMENTED ON CACHE BOOL "")
set(CLANG_BOOTSTRAP_TARGETS
  generate-profdata
  stage2
  stage2-distribution
  stage2-install-distribution
  stage2-install-distribution-toolchain
  stage2-check-all
  stage2-check-llvm
  stage2-check-clang
  stage2-test-suite CACHE STRING "")

set(PGO_INSTRUMENT_LTO ON CACHE BOOL "")

if(PGO_INSTRUMENT_LTO)
  set(BOOTSTRAP_LLVM_ENABLE_LTO ${PGO_INSTRUMENT_LTO} CACHE BOOL "")
  set(BOOTSTRAP_BOOTSTRAP_LLVM_ENABLE_LTO ${PGO_INSTRUMENT_LTO} CACHE BOOL "")
endif()
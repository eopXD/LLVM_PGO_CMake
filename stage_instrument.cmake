### User defined path / variables
set(PGO_STAGE_INSTRUMENT_INSTALL_PATH /scratch/eopc/PGO/stage_instrument_install CACHE STRING "")

### Don't need to edit below
set(CMAKE_C_COMPILER clang CACHE STRING "")
set(CMAKE_CXX_COMPILER clang++ CACHE STRING "")

set(CMAKE_INSTALL_PREFIX ${PGO_STAGE_INSTRUMENT_INSTALL_PATH} CACHE STRING "")

set(CMAKE_BUILD_TYPE RELEASE CACHE STRING "")

set(LLVM_TARGETS_TO_BUILD Native CACHE STRING "")
set(LLVM_ENABLE_PROJECTS "clang;lld" CACHE STRING "")
set(LLVM_ENABLE_RUNTIMES "compiler-rt;libcxx;libcxxabi" CACHE STRING "")

set(BUILD_SHARED_LIBS OFF CACHE BOOL "")
set(LLVM_CCACHE_BUILD ON CACHE BOOL "")
set(LLVM_ENABLE_ASSERTIONS ON CACHE BOOL "")

set(LLVM_BUILD_INSTRUMENTED IR CACHE STRING "")
set(LLVM_BUILD_RUNTIME No CACHE STRING "")

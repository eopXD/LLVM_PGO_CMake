CMakes to build PGO Clang

---

NOTE: Please set your install paths within the CMake.

Official documents from official LLVM site:
- https://llvm.org/docs/HowToBuildWithPGO.html#building-clang-with-pgo
- https://llvm.org/docs/AdvancedBuilds.html#multi-stage-pgo
- https://github.com/llvm/llvm-project/blob/main/clang/cmake/caches/PGO.cmake

```
# Build an instrumenting clang
rm -rf stage_instrument*; mkdir stage_instrument ;cd stage_instrument
cmake -G Ninja -C /scratch/eopc/PGO_cmake/stage_instrument.cmake /scratch/eopc/upstream-llvm-project/llvm
ninja all -j30
ninja install -j30
cd ..

# Build a profiling clang
rm -rf stage_profiling*; mkdir stage_profiling ;cd stage_profiling
cmake -G Ninja -C /scratch/eopc/PGO_cmake/stage_profiling.cmake /scratch/eopc/upstream-llvm-project/llvm
ninja all -j30
ninja check-llvm 
ninja check-clang
/scratch/eopc/PGO/stage_1/bin/llvm-profdata merge -output=/scratch/eopc/PGO/profdata.prof /scratch/eopc/PGO/stage_pgo/profiles/*.profraw
cd ..

# Build a profile-guilded-optimized clang
rm -rf stage_pgo*; mkdir stage_pgo ;cd stage_pgo
cmake -G Ninja -C /scratch/eopc/PGO_cmake/stage_pgo.cmake /scratch/eopc/upstream-llvm-project/llvm
ninja all -j30
```

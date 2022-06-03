CMakes to build PGO Clang

---

NOTE: Please set your install paths within the CMake.

Official documents from official LLVM site:
- https://llvm.org/docs/HowToBuildWithPGO.html#building-clang-with-pgo
- https://llvm.org/docs/AdvancedBuilds.html#multi-stage-pgo
- https://github.com/llvm/llvm-project/blob/main/clang/cmake/caches/PGO.cmake

Stage 1 - "Compiler" phase 
- Build a stable clang
Stage 2 - "Instrument & profile" phase
- Build clang with stable clang
- Run built clang with instrumentation functionality
Stage 3 - PGO phase
- Build clang with stable clang, with profile data attached

Notes:
- gather generated profile with

```
/path/to/stage1/llvm-profdata merge -output=/path/to/output/profdata.prof /path/to/stage1/profiles/*.profraw
```

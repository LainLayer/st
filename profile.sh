set -xe

make MODE=GEN -B -j12
rm -f code.profdata *.profraw
LLVM_PROFILE_FILE="./code-%p.profraw" ./st
LLVM_PROFILE_FILE="./code-%m.profraw" ./st
llvm-profdata merge -output=code.profdata code-*.profraw
rm -f code.profdata *.profraw
make MODE=RES -B -j12

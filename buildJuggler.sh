#!/bin/bash
# cmake wrapper to build juggler
# - assumes you've symlinked or cloned juggler to `./juggler`
# - build dir will be juggler/build
# - don't run too many parallel jobs
# - WARNING: nasty kluge (see kluge.sh)
#
pushd juggler
cmake -B build -S . \
  -DCMAKE_INSTALL_PREFIX=$JUGGLER_INSTALL_PREFIX \
  -DCMAKE_FIND_DEBUG_MODE=OFF \
  && \
../kluge.sh && \
cmake --build build -j2 -- install && \
popd && exit 0
popd
exit 1

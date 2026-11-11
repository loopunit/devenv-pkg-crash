devenv --from path:../devenv-pkg-crash/base-env shell --no-reload
devenv --from 'github:loopunit/devenv-pkg-crash?dir=base-env' shell --no-reload

devenv --from path:../devenv-pkg-crash/with-lq shell --no-reload
devenv --from 'github:loopunit/devenv-pkg-crash?dir=with-lq' shell --no-reload

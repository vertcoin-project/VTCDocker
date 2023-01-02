# VTCDocker
## Dockerfiles for building Vertcoin-Core

### Functioning builds
- [x] **arm-linux-gnueabihf**
- [x] **aarch64-linux-gnu**
- [x] **riscv64-linux-gnu**
- [x] **x86_64-w64-mingw32**
- [x] **x86_64-linux-gnu**
- [x] **x86_64-apple-darwin18**

```
git clone https://github.com/vertcoin-project/vertcoin-core.git vertcoin-core-release && cd vertcoin-core-release
git checkout 22.x
cd ..
git clone https://github.com/vertcoin-project/VTCDocker.git && cd VTCDocker
./dockerBuild.sh
sudo ./release.sh
```
By default, all builds will be compiled.  You may specify a specific build by editing the `release.sh` file.  Every time you edit a build file, you must re-run `dockerBuild.sh` before `release.sh`

View Docker container log:
```
docker container log -f CONTAINER_ID
```

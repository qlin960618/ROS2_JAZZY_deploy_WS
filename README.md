# ROS2_JAZZY_deploy_WS
Deployment workspace for sas and other development tool under ros2 Jazzy for the NML Panda system

Check [smart_arm_stack_ROS2](https://github.com/SmartArmStack/smart_arm_stack_ROS2) for the original implementation.

## Additional dependencies
- [dqrobotics_cpp-interface-json](https://github.com/dqrobotics/cpp-interface-json11)
- [dqrobotics_cpp-interface-qpoases](https://github.com/dqrobotics/cpp-interface-qpoases)
- [dqrobotics_cpp-interface-vrep](https://github.com/dqrobotics/cpp-interface-vrep)
- [dqrobotics_cpp-coppeliasim-zmq](https://github.com/dqrobotics/cpp-interface-coppeliasim-zmq)
- [dqrobotics_cpp](https://github.com/dqrobotics/cpp)
- [dqrobotics_python](https://github.com/dqrobotics/python)



### Libfranka Build notes for the Panda robot (Version 0.14.1)

- [pinocchio](https://github.com/frankaemika/libfranka)
```shell
sudo apt-get install -y \
    liburdfdom-headers-dev \
    libconsole-bridge-dev \
    libtinyxml2-dev
    
sudo apt-get install -qqy lsb-release curl
mkdir -p /etc/apt/keyrings
curl http://robotpkg.openrobots.org/packages/debian/robotpkg.asc \
    | sudo tee /etc/apt/keyrings/robotpkg.asc
echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/robotpkg.asc] http://robotpkg.openrobots.org/packages/debian/pub $(lsb_release -cs) robotpkg" \
    | sudo tee /etc/apt/sources.list.d/robotpkg.list
sudo apt-get update \
    && sudo apt-get install -qqy robotpkg-pinocchio
```
- [libfranka](https://github.com/frankaemika/libfranka) current version 0.14.1
```shell
git clone --recursive https://github.com/frankaemika/libfranka.git
cd libfranka
git checkout 0.14.1
git submodule update
mkdir build
cd build
export CMAKE_PREFIX_PATH=/opt/openrobots/lib/cmake
cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTS=OFF [-DCMAKE_PREFIX_PATH=/opt/openrobots/lib/cmake] ..
cmake --build .
cpack -G DEB
sudo dpkg -i libfranka*.deb
  

```
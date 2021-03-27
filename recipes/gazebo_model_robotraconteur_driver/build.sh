#!/bin/sh

set -e

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac

if [ "$machine" == "Linux" ]; then
  dotnet publish GazeboModelRobotRaconteurDriver.csproj --self-contained true --runtime linux-x64 -c Release -o $PREFIX/opt/gazebo_model_robotraconteur_driver
elif [ "$machine" == "Mac" ]; then
  dotnet publish GazeboModelRobotRaconteurDriver.csproj --self-contained true --runtime osx-x64 -c Release -o $PREFIX/opt/gazebo_model_robotraconteur_driver
else
  echo "Unknown platform for dotnet publish"
  exit 1
fi
cp $RECIPE_DIR/gazebo_model_robotraconteur_driver $PREFIX/bin/
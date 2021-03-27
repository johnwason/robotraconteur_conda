set -e

cp -r gz_example $PREFIX/

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac

if [ "$machine" == "Linux" ]; then
  cp $RECIPE_DIR/run_2ur5e_sim $PREFIX/bin/
elif [ "$machine" == "Mac" ]; then
  cp $RECIPE_DIR/run_2ur5e_sim_mac $PREFIX/bin/run_2ur5e_sim
else
  echo "Unknown platform for training sim"
  exit 1
fi

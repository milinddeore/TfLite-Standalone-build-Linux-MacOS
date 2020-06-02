# Tensorflow Lite Standalone C++ build for Linux and MacOS

Even before deploying your software and model onto ARM devices ([Android](https://github.com/tensorflow/tensorflow/blob/master/tensorflow/lite/g3doc/guide/build_arm64.md), [iOS](https://github.com/tensorflow/tensorflow/blob/master/tensorflow/lite/g3doc/guide/build_ios.md), [Rpi](https://github.com/tensorflow/tensorflow/blob/master/tensorflow/lite/g3doc/guide/build_rpi.md)), you would defiantly test on your Linux or Macbook.
Its quite easy with python, but deployment is often in C++ and thats when you would need standalone build. This 
repository tries gives demo setup. 

Tensorflow Release : 2.1.1 
OS : Darwin Kernel Version 17.7.0
Bazel : 3.0.0

## Clone TF
```
git clone https://github.com/tensorflow/tensorflow.git
cd tensorflow
```

**Install Bazel** 
Follow the process mentioned [here](https://docs.bazel.build/versions/1.1.0/install-os-x.html) link. 
We are now ready to configure tensorflow, run following command: 

```
./configure
```

Time to build `tensorflowlite` dynamic library. The choice is yours weather you need dynamic (shared object) or static library,
but for the demo we will build dynamic library. 

```
bazel build -c opt  //tensorflow/lite:libtensorflowlite.dylib
```

I faced an issue where bazel build was failing with following error message "**Xcode version must be specified to use an Apple CROSSTOOL**"
solution can be found [here](https://github.com/bazelbuild/bazel/issues/4314#issuecomment-370172472)


# Create Workspace / Project: 
If you clone this repo, it has all the required includes as well as dynamic library. But in case you want your own tensorflow release
of software, you need to pull few `include` folders from tensorflow repo to your project workspace.

```
cp -r ./tensorflow/lite  ~/TfLite-Standalone-build-Linux-MacOS/tensorflow/
mkdir -p ~/TfLite-Standalone-build-Linux-MacOS/tensorflow/core/util
cp -r ./tensorflow/core/util ~/TfLite-Standalone-build-Linux-MacOS/tensorflow/core/
cp ./bazel-out/darwin-opt/bin/tensorflow/lite/libtensorflowlite.dylib ~/TfLite-Standalone-build-Linux-MacOS
```

# Compile your project
Compile the project using `make` utility. Please make sure all the paths are proper in the `Makefile`, else make the appropriate changes. 

You are all set! 




main:
	g++ -std=c++11 '-Wl,-rpath,$$ORIGIN/lib'  minimal.cc -o minimal -L. -ltensorflowlite -I tensorflow/lite/tools/make/downloads/flatbuffers/include  -I ./tensorflow/lite/tools/make/downloads/absl  -I./include -I. -lstdc++ -ldl -lpthread -lm 

clean:
	rm -rf minimal

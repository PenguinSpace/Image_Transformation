# Nelson Yeung
# PA3
# CPSC 1020, Section 001, Spring 2019
# nyeung
# Dr. Yvon Feaster

# Config, just variables
CC =g++
CFLAGS =-Wall -g -std=c++11
LFLAGS =-lm

# change target from program to program
TARGET=Image

# Generate source and object lists, also just string variables
C_SRCS := \
  $(wildcard *.cpp) \
  $(wildcard src/*.cpp) \
  $(wildcard src/**/*.cpp) \

HDRS := \
  $(wildcard *.h) \
  $(wildcard src/*.h) \
  $(wildcard src/**/*.h) \

OBJS := $(patsubst %.cpp, bin/%.o, $(wildcard *.cpp))
OBJS += $(filter %.o, $(patsubst src/%.cpp, bin/%.o, $(C_SRCS)))

# default target
all: build
		@echo "All Done!"

# Link all built objects
build: $(OBJS)
		$(CC) $(OBJS) -o $(TARGET) $(LFLAGS)

which:
		@echo "FOUND SOURCES: ${C_SRCS}"
		@echo "FOUND HEADERS: ${HDRS}"
		@echo "TARGET OBJS: $(OBJS)"

# Catch root directory src files
bin/%.o: %.cpp $(HDRS)
		@mkdir -p $(dir $@)
		$(CC) $(CFLAGS) -c $< -o $@

# Catch all nested directory files
bin/%.o: src/%.cpp $(HDRS)
		@mkdir -p $(dir $@)
		$(CC) $(CFLAGS) -c $< -o $@

clean:
		rm -f $(TARGET)
		rm -rf bin

# changed from run
run: build
		./$(TARGET) oneTiger.ppm test.ppm

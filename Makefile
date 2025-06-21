# Compiler and Flags
CXX = g++
CXXFLAGS = -std=c++17 -g -Wall -I. -Isrc/app/encryptDecrypt -Isrc/app/fileHandling -Isrc/app/processes
LDFLAGS = -lstdc++fs  # Required for GCC 8.x to link <filesystem>

# Targets
MAIN_TARGET = encrypt_decrypt
CRYPTION_TARGET = cryption

# Source Files
MAIN_SRC = main.cpp \
        src/app/processes/ProcessManagement.cpp \
        src/app/fileHandling/IO.cpp \
        src/app/fileHandling/ReadEnv.cpp \
        src/app/encryptDecrypt/Cryption.cpp

CRYPTION_SRC = src/app/encryptDecrypt/CryptionMain.cpp \
            src/app/encryptDecrypt/Cryption.cpp \
            src/app/fileHandling/IO.cpp \
            src/app/fileHandling/ReadEnv.cpp

# Object Files
MAIN_OBJ = $(MAIN_SRC:.cpp=.o)
CRYPTION_OBJ = $(CRYPTION_SRC:.cpp=.o)

# Default Target
all: $(MAIN_TARGET) $(CRYPTION_TARGET)

# Build Rules
$(MAIN_TARGET): $(MAIN_OBJ)
	$(CXX) $(CXXFLAGS) $^ -o $@ $(LDFLAGS)

$(CRYPTION_TARGET): $(CRYPTION_OBJ)
	$(CXX) $(CXXFLAGS) $^ -o $@ $(LDFLAGS)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Clean Rule
clean:
	rm -f $(MAIN_OBJ) $(CRYPTION_OBJ) $(MAIN_TARGET) $(CRYPTION_TARGET)

.PHONY: clean all

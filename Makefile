# Makefile for the Wolfing Processing Library
UNAME=$(shell uname)

# JLINK location on OSX (Home Edition)
ifeq ($(UNAME), Darwin)
JLINK_DIR=/Applications/Mathematica.app/Contents/SystemFiles/Links/JLink
JLINK_LIB=$(JLINK_DIR)/SystemFiles/Libraries/MacOSX-x86-64/libJLinkNativeLibrary.jnilib
P5_PATH=/Applications/Processing.app/Contents/Java
endif

# JLINK location on Raspberry Pi (not yet tested !!!)
ifeq ($(UNAME), Linux)
JLINK_DIR=/opt/Wolfram/WolframEngine/10.0/SystemFiles/Links/JLink
JLINK_LIB=$(JLINK_DIR)/SystemFiles/Libraries/Linux-ARM/libJLinkNativeLibrary.so
P5_PATH=/usr/local/lib/processing
endif

LIBRARY=library/wolfing.jar
WOLFING=build/wolfing.jar
SOURCES=src/bitcraftlab/wolfing/*.java
CLASSES=build/bitcraftlab/wolfing/*.class

JLINK_JAR=$(JLINK_DIR)/JLink.jar
P5_JARS=$(P5_PATH)/core.jar

install:	$(LIBRARY)
build:		$(WOLFING)
compile:	$(CLASSES)

$(LIBRARY):	$(WOLFING)
	cp $(WOLFING) $(LIBRARY)

$(WOLFING):	$(CLASSES)	
	jar -cf $(WOLFING) -C build bitcraftlab

$(CLASSES):	$(SOURCES)
	javac -cp "${JLINK_JAR}:${P5_JARS}" -d build ${SOURCES}

link:
	ln -f -s "$(JLINK_JAR)" library/
	ln -f -s "$(JLINK_LIB)" library/
	ln -f -s "$(JLINK_DIR)/License.txt" library/JLink-License.txt

clean:
	rm -r build/*


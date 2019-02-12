# Makefile for the Wolfing Processing Library - OSX Version

# JLINK_DIR=/opt/Wolfram/WolframEngine/10.0/SystemFiles/Links/JLink
# JLINK_LIB=$(JLINK_DIR)/SystemFiles/Libraries/Linux-ARM/libJLinkNativeLibrary.so
JLINK_DIR=/Applications/Mathematica.app/SystemFiles/Links/JLink
JLINK_LIB=$(JLINK_DIR)/SystemFiles/Libraries/MacOSX-x86-64/libJLinkNativeLibrary.jnilib
JLINK_JAR=$(JLINK_DIR)/JLink.jar

LIBRARY=library/wolfing.jar
WOLFING=build/wolfing.jar
SOURCES=src/bitcraftlab/wolfing/*.java
CLASSES=build/bitcraftlab/wolfing/*.class

P5_PATH=/Applications/Processing.app/Contents/Java
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
	rm -rf build/*




# Makefile for the Wolfing Processing Library

JLINK_DIR=/opt/Wolfram/WolframEngine/10.0/SystemFiles/Links/JLink
JLINK_JAR=$(JLINK_DIR)/JLink.jar

LIBRARY=library/wolfing.jar
WOLFING=build/wolfing.jar
SOURCES=src/bitcraftlab/wolfing/*.java
CLASSES=build/bitcraftlab/wolfing/*.class

install:	$(LIBRARY)
build:		$(WOLFING)
compile:	$(CLASSES)

$(LIBRARY):	$(WOLFING)
	cp $(WOLFING) $(LIBRARY)

$(WOLFING):	$(CLASSES)	
	jar -cf $(WOLFING) -C build bitcraftlab

$(CLASSES):	$(SOURCES)
	javac -cp ${JLINK_JAR} -d build ${SOURCES}

link:
	ln -t library -f -s $(JLINK_JAR)
	ln -t library -f -s $(JLINK_DIR)/SystemFiles/Libraries/Linux-ARM/libJLinkNativeLibrary.so
	ln -s $(JLINK_DIR)/License.txt library/JLink-License.txt

clean:
	rm -r build/*




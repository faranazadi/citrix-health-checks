#
# Copyright (c) Citrix Systems, Inc.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
#
#   1) Redistributions of source code must retain the above copyright
#      notice, this list of conditions and the following disclaimer.
#
#   2) Redistributions in binary form must reproduce the above
#      copyright notice, this list of conditions and the following
#      disclaimer in the documentation and/or other materials
#      provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
# FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
# COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
# INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
# HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
# STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
# OF THE POSSIBILITY OF SUCH DAMAGE.
#

# Makefile to compile the Xen Java SDK bindings and tests

BINDINGJAVAFILES := $(wildcard com/xensource/xenapi/*.java)
BINDINGCLASSFILES := $(BINDINGJAVAFILES:.java=.class)
BINDINGJAR := xenserver-8.1.1.jar

CLASSPATH := :xmlrpc-client-3.1.3.jar:xmlrpc-common-3.1.3.jar:ws-commons-util-1.0.2.jar

.PHONY: all
all: $(BINDINGJAR) tests
	@ :

# Target to compile the automated tests
.PHONY: tests
tests: $(patsubst %.java,%.class,$(wildcard *.java))
	@ :

.PHONY: docs
docs:
	javadoc -classpath ${CLASSPATH} -d doc -link http://java.sun.com/javase/6/docs/api com/xensource/xenapi/*.java

%.class: %.java
	javac -cp ${CLASSPATH} $^

$(BINDINGJAR): $(BINDINGCLASSFILES)
	jar -cvf $@ com/xensource/xenapi/*.class

.PHONY: cleanclass
cleanclass:
	rm -f com/xensource/xenapi/*.class
	rm -f *.class

.PHONY: cleanjar
cleanjar:
	rm -f $(BINDINGJAR)

.PHONY: cleandocs
cleandocs:
	rm -rf doc

.PHONY: clean
clean: cleanjar cleanclass cleandocs
	@ :

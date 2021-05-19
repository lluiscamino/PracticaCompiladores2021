#! /bin/bash
as asm/forloop.asm -o asm/forloop.asm.o
ld asm/forloop.asm.o -o asm/forloop.asm-exec -macosx_version_min 11.0  -L /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -lSystem
./asm/forloop.asm-exec > outputs/forloop.asm.txt
diff -y -q -w outputs/forloop.asm.txt expectedoutputs/forloop.asm.txt
as asm/printmax.asm -o asm/printmax.asm.o
ld asm/printmax.asm.o -o asm/printmax.asm-exec -macosx_version_min 11.0  -L /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -lSystem
./asm/printmax.asm-exec > outputs/printmax.asm.txt
diff -y -q -w outputs/printmax.asm.txt expectedoutputs/printmax.asm.txt
as asm/printstrings.asm -o asm/printstrings.asm.o
ld asm/printstrings.asm.o -o asm/printstrings.asm-exec -macosx_version_min 11.0  -L /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -lSystem
./asm/printstrings.asm-exec > outputs/printstrings.asm.txt
diff -y -q -w outputs/printstrings.asm.txt expectedoutputs/printstrings.asm.txt
as asm/while.asm -o asm/while.asm.o
ld asm/while.asm.o -o asm/while.asm-exec -macosx_version_min 11.0  -L /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -lSystem
./asm/while.asm-exec > outputs/while.asm.txt
diff -y -q -w outputs/while.asm.txt expectedoutputs/while.asm.txt
as asm/printstringslength.asm -o asm/printstringslength.asm.o
ld asm/printstringslength.asm.o -o asm/printstringslength.asm-exec -macosx_version_min 11.0  -L /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -lSystem
./asm/printstringslength.asm-exec > outputs/printstringslength.asm.txt
diff -y -q -w outputs/printstringslength.asm.txt expectedoutputs/printstringslength.asm.txt
as asm/fibonacci.asm -o asm/fibonacci.asm.o
ld asm/fibonacci.asm.o -o asm/fibonacci.asm-exec -macosx_version_min 11.0  -L /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -lSystem
./asm/fibonacci.asm-exec > outputs/fibonacci.asm.txt
diff -y -q -w outputs/fibonacci.asm.txt expectedoutputs/fibonacci.asm.txt
as asm/lucassequence.asm -o asm/lucassequence.asm.o
ld asm/lucassequence.asm.o -o asm/lucassequence.asm-exec -macosx_version_min 11.0  -L /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -lSystem
./asm/lucassequence.asm-exec > outputs/lucassequence.asm.txt
diff -y -q -w outputs/lucassequence.asm.txt expectedoutputs/lucassequence.asm.txt
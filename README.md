# ASPL
Adaptive stack-based programming language. JS-version of @Kcreate/stackvm

```bash
node src/assembler -i [script.asm] -o [output.bin] # compile a script to binary
node src -p [program.bin] # run a binary executable
```

### Language architecture
```
+----------------------------------------------+
| Instruction |             Asm code/represent |
+----------------------------------------------+
| Labels:                     :label           |
| Reference to predef label:  LDV16, :label    |
| Comments:                   ; some comment   |
| Add:                        0000             |
| Substract:                  0001             |
| Multiply:                   0010             |
| Divide:                     0011             |
| Increment:                  0100             |
| Decrement:                  0101             |
| Left shift:                 0110             |
| Right shift: 	              0111             |
| And: 	                      1000             |
| Or: 	                      1001             |
| Xor: 	                      1010             |
| Not:        	              1011             |
+----------------------------------------------+
```

``` 
Sample output after compilation:
Read 10 instructions, including labels.
Expanded to 8, including labels.
Removed labels. Final instruction count: 7/65535

{ '.l1': 
  { type: 2, size: 14, address: 7, data: 'Hello, World!' }   
}

Successfully compiled to binary file output.bin

```
```
Sample debug session:
Memory:
0000    08c1 0009 0008 0009 1d01 030b 1c81 030b 1d41 030b 1941 030b 0281 030b 000a 16c1
0010    0009 0008 0009 1d01 030b 1c81 030b 1d41 030b 1941 030b 0281 030b 000a 0081 000b
0020    2781 0009 0008 0281 0291 0009 1141 030b 1c41 030b 1d41 030b 1841 030b 1b01 030b
0030    0801 030b 18c1 030b 1a01 030b 1941 030b 18c1 030b 1ac1 030b 0e81 030b 000a 10d7
0040    11a1 0089 0008 1351 0049 0008 0049 0010 000a 1357 00e1 0089 0008 0009 1981 030b
0050    1841 030b 1b01 030b 1cc1 030b 1941 030b 0281 030b 000a 02c1 0291 0009 1381 030b
0060    1bc1 030b 1d01 030b 0801 030b 1141 030b 1c41 030b 1d41 030b 1841 030b 1b01 030b
0070    0801 030b 18c1 030b 1a01 030b 1941 030b 18c1 030b 1ac1 030b 0e81 030b 000a 20d7
0080    21a1 0089 0008 2351 0049 0008 0049 0010 000a 2357 2421 0089 0008 04a1 0089 0008
0090    0009 1981 030b 1841 030b 1b01 030b 1cc1 030b 1941 030b 0281 030b 000a 000c 0000
00a0    0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000
00b0    0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000
00c0    0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000
00d0    0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000
00e0    0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000
00f0    0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000
0100
Page 1/255

Instruction: (LDV) 0000100011000001
```

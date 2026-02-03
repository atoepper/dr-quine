# Dr-Quine
## Overview

Dr-Quine is a project focused on quine generation and manipulation. A quine is a program that outputs its own source code when executed. Quines are more than just programming curiosities—they are valuable tools for understanding self-replicating code, compiler and interpreter behaviors, and code templating techniques. They can also be used for educational purposes, obfuscation, and meta-programming experiments.
Dr-Quine automates the process of creating, modifying, and executing quines, providing a framework to explore these fascinating programs systematically.

## Particles of a Quine
 
In Dr-Quine, quines are broken down into particles, which are the fundamental building blocks of a self-replicating program:
1. **Template** – The skeleton or structure of the quine. It contains placeholders for code fragments and data that will be inserted at runtime.
2. **Code Fragments** – Pieces of executable instructions that the quine outputs.
3. **Data** – Literal strings or values that the quine prints as part of its self-replication.
By separating a quine into particles, Dr-Quine allows flexible assembly of new quines, modification of existing ones, and recursive generation.

## From Code to Template
Turning a program into a quine template involves:
1. **Identifying static and dynamic parts**: Determine which parts of the program remain constant and which are generated during execution.
2. **Replacing dynamic parts with placeholders**: Use tokens or markers in the template where code fragments or data will be inserted.
3. **Embedding self-output logic**: Ensure that the program contains instructions to read the template and fill in the placeholders, producing an exact copy of itself.
Dr-Quine provides utilities to automate these transformations, letting users focus on creating interesting quines without manually handling all self-replication logic.

## Implemented Quines
Dr-Quine comes with three example quines to demonstrate different approaches and behaviors:
1. **Colleen** – A simple, straightforward quine that illustrates the basic principles of self-replication.
2. **Grace** – A quine designed to leverage template-based macros (or code fragments) for flexible generation and easier modification.
3. **Sully** – A recursive quine that generates new instances of itself with minor modifications, showcasing dynamic quine behavior.
These examples serve as both educational references and practical starting points for creating new quines with Dr-Quine.

## Testing Quines
Testing in Dr-Quine focuses on verifying that generated quines reproduce their source code exactly. The process includes:
1. Automated execution – Generated quines are run programmatically.
2. Output comparison – The program output is compared byte-for-byte with its original source code to ensure perfect replication.
3. Recursive validation – For quines like Sully that generate additional instances, the newly generated files are also tested to confirm continued correctness.
This ensures reliability across all quines, whether simple, recursive, or template-driven.

## How to Use and Build the Project
### Requirements
- `gcc`
- `Git`
- `Make` (optional, for build automation)

### Installation
```
git clone https://github.com/yourusername/dr-quine.git
cd dr-quine
```
### Compile and test the c files
```
cd /home/path/todr-quine/C && make test
```

### Compile and test the c files
```
cd /home/path/to/dr-quine/ASM && make & bash ./test.sh
```

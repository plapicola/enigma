# Enigma

## Learning Goals / Areas of Focus

- Practice breaking a program into logical components

- Build classes that demonstrate single responsibilities

- Test drive a well-designed Object Oriented solution

- Work with file i/o

## Overview

This project uses Ruby to build a tool for encoding, decoding, and cracking the WWII era message encryption employed by German forces.

### To encrypt a message run
``` bash
ruby ./lib/encrypt.rb <Source> <Destination>
```
Output of the encrypted message will include the key and date used to encrypt the message, which is required for decryption.

### To decrypt a message run
``` bash
ruby ./lib/decrypt.rb <Source> <Destination> <Key> <Date>
```

### To crack a message run
``` bash
ruby ./lib/crack.rb <Source> <Destination> <Date>
```

## Self Assessment
Functionality: 4

OOP: 4

TDD: 4

Version Control: 4

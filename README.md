# number2number

This is sample stack project with little task. He is converting number between different systems. Algorithm is written in declarative style and good approach for study.

## Install

You can locally build and run `number2number` by

1. Installing [stack](https://www.haskellstack.org)
2. Cloning this repo
3. Building `number2number` with `stack`.

That is, to say

```bash
$ curl -sSL https://get.haskellstack.org/ | sh
$ git clone https://github.com/Dimercel/number2number.git
$ cd number2number
$ stack build
```

## Overview

Simple session:

```
stack exec number2number-exe
Enter a number:
>> 255
Enter a radix of number[2-36]:
>> 10
Enter a result radix[2-36]:
>> 16
Result:
FF
```

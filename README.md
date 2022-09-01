## snarkjs-template ##
---
A template to quickly start [snarkjs](https://github.com/iden3/snarkjs).


### Run init.sh ###
```
./init.sh
```   
If prompted **permission denied**, please run `chmod 777 ./init.sh`   

### Create circuit.circom ###

```
pragma circom 2.0.0;

template Multiplier() {
    signal input a;
    signal input b;
    signal input c;
    c===a*b;
}

component main {public [c]} = Multiplier();
```

### Create input.json ###
```
{ "a": 3, "b": 11, "c": 33 }
```

### Run prove.sh ###
```
./prove.sh
```

### nodejs verify ###
```
npm install
node test.js
```
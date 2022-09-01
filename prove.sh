#step10
circom circuit.circom --r1cs --wasm --sym

#step11
snarkjs r1cs info circuit.r1cs

#step12
snarkjs r1cs print circuit.r1cs circuit.sym

#step13
snarkjs r1cs export json circuit.r1cs circuit.r1cs.json

#step14
cd circuit_js
node  generate_witness.js circuit.wasm ../input.json ../witness.wtns
cd ../

#step15
snarkjs groth16 setup circuit.r1cs pot12_final.ptau circuit_0000.zkey

#step16
snarkjs zkey contribute circuit_0000.zkey circuit_0001.zkey --name="1st Contributor Name" -v

#step17
snarkjs zkey contribute circuit_0001.zkey circuit_0002.zkey --name="Second contribution Name" -v -e="Another random entropy"

#step18
snarkjs zkey export bellman circuit_0002.zkey  challenge_phase2_0003
snarkjs zkey bellman contribute bn128 challenge_phase2_0003 response_phase2_0003 -e="some random text"
snarkjs zkey import bellman circuit_0002.zkey response_phase2_0003 circuit_0003.zkey -n="Third contribution name"

#step19
snarkjs zkey verify circuit.r1cs pot12_final.ptau circuit_0003.zkey

#step20
snarkjs zkey beacon circuit_0003.zkey circuit_final.zkey 0102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f 10 -n="Final Beacon phase2"

#step21
snarkjs zkey verify circuit.r1cs pot12_final.ptau circuit_final.zkey

#step22
snarkjs zkey export verificationkey circuit_final.zkey verification_key.json

#step23
snarkjs groth16 prove circuit_final.zkey witness.wtns proof.json public.json

#step24
snarkjs groth16 verify verification_key.json public.json proof.json

#step25
#snarkjs zkey export solidityverifier circuit_final.zkey verifier.sol

#step26
#snarkjs zkey export soliditycalldata public.json proof.json
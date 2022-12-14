#step1
snarkjs powersoftau new bn128 12 pot12_0000.ptau -v

#step2
snarkjs powersoftau contribute pot12_0000.ptau pot12_0001.ptau --name="First contribution" -v

#step3
snarkjs powersoftau contribute pot12_0001.ptau pot12_0002.ptau --name="Second contribution" -v -e="some random text"

#step4
snarkjs powersoftau export challenge pot12_0002.ptau challenge_0003
snarkjs powersoftau challenge contribute bn128 challenge_0003 response_0003 -e="some random text"
snarkjs powersoftau import response pot12_0002.ptau response_0003 pot12_0003.ptau -n="Third contribution name"

#step5
snarkjs powersoftau verify pot12_0003.ptau

#step6
snarkjs powersoftau beacon pot12_0003.ptau pot12_beacon.ptau 0102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f 10 -n="Final Beacon"

#step7
snarkjs powersoftau prepare phase2 pot12_beacon.ptau pot12_final.ptau -v

#step8
snarkjs powersoftau verify pot12_final.ptau

#step9
#create circuit.circom

rm circuit.r1cs
rm circuit.sym
rm -r ./circuit_js
rm circuit.r1cs.json
rm witness.wtns
rm circuit_0000.zkey
rm circuit_0001.zkey
rm circuit_0002.zkey
rm challenge_phase2_0003
rm response_phase2_0003
rm circuit_0003.zkey
rm circuit_final.zkey
rm verification_key.json
rm proof.json
rm public.json

if [ $1 == "all" ]
then
rm pot12_final.ptau
rm pot12_beacon.ptau
rm pot12_0003.ptau
rm response_0003
rm challenge_0003
rm pot12_0002.ptau
rm pot12_0001.ptau
rm pot12_0000.ptau
fi
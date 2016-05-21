ID =: =@(i.@(2&^)) NB. ID n produces an n-qubit identity matrix, ID 3 will produce an 8x8, ID 4 16x16, etc.
tp =: ,./^:2@:(*/) NB. Tensor product
mp =: +/ . * NB. Matrix product 
xor =: 2|+ NB. XOR/addition mod 2
one =: 1 1$ 1 NB. Single element matrix
binarylist =: #:@(i.@#) NB. binarylist n produces a list of binary values for the interval [0,n-1]
K =: ((2^#@]),1:) $ #.@]=(i.@(2^#@])) NB. Ket, takes a space-separated binary string q1 q2 ... qn and produces state |q1>|q2>...|qn>
B =: (1:,(2^#@])) $ #.@]=(i.@(2^#@])) NB. Bra, operates similar to ket producing <q1|<q2|...<qn|
hada =: (% %: 2)*((],.]),(],.-@])) NB. Not used, recursive definition of Hadamard matrix
measure =: +/@(+/\@(*:@|@,)<?@0:) NB. Produces an integer value over domain of qubit system using probability amplitudes
QFT =: (%@%:@:])*(^@:((2p1*0j1)*(%@:]))^(i.@:] */ i.@:])) NB. Quantum Fourier transform, QFT n produces an nxn matrix
compbasis =: compbasis =: K"1 #:@(i.@(2^])) NB. Returns the computational basis states for a given number of qubits
KtoB =: (1:,#)$, NB. |x> -> <x|
BtoK =: ((#@,),1:)$, NB. <x| -> |x>
compbasisprojs =: (compbasis ]) mp"2 (KtoB"2@(compbasis ])) NB. Returns the computational basis projectors for a given number of qubits
cUgate =: (((K 0) mp (B 0)) tp (ID 1)) + (((K 1) mp (B 1)) tp ]) NB. Creates a 2-qubit controlled gate where the argument is applied to the second qubit
trace =: +/^:2@(]*(ID@((2&^.)@#))) NB. Performs trace operation on a matrix
HD =: ([: % 2 ^ 2 %~ ])*_1^((#:@i.@((2&^)@:]))mp(|:@#:@i.@((2&^)@:]))) NB. HD n produces an n-qubit Hadamard matrix
measureQ =: 4 : ' +/ (*:((I. -.(x {"1 binarylist y)) { y))' NB. Not used yet
permMat =: +/@((K"1@(#:@])) mp"2 (KtoB"2@(compbasis@(2^.#@])))) NB. Takes a permutation of a domain and produces a mappping
permOracle =: 1 : 'permMat ((2*((i.2^y),(i.2^y))) + ((u (i.2^y)),(-.(u (i.2^y)))))' NB. If f is a permutation, permOracle produces mapping
createOracle =: 1 : '+/ (compbasisprojs y) tp"2 (((-.(K"0(u (i.(2^y))))) mp (B 1)) + ((K"0(u (i.(2^y)))) mp (B 0)))' 

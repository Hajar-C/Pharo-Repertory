Class {
	#name : 'DieHandleTest',
	#superclass : 'TestCase',
	#category : 'Dice',
	#package : 'Dice'
}

{ #category : 'tests' }
DieHandleTest >> testAddingTwiceTheSameDice [
	| handle |
	handle := DieHandle new.
	handle addDie: (Die withFaces: 6).
	self assert: handle diceNumber equals: 1.
	handle addDie: (Die withFaces: 6).
	self assert: handle diceNumber equals: 2
]

{ #category : 'tests' }
DieHandleTest >> testCreationAdding [
	| handle |
	handle := DieHandle new
		addDie: (Die withFaces: 6);
		addDie: (Die withFaces: 10);
		yourself.
	self assert: handle diceNumber equals: 2
]

{ #category : 'tests' }
DieHandleTest >> testRoll [
	| handle |
	handle := DieHandle new
		addDie: (Die withFaces: 6);
		addDie: (Die withFaces: 10);
		yourself.
	10 timesRepeat: [
		self assert: (handle roll between: 2 and: 16) ]
]

{ #category : 'tests' }
DieHandleTest >> testSimpleHandle [
	self assert: 2 D20 diceNumber equals: 2
]

{ #category : 'tests' }
DieHandleTest >> testSumOfHandles [
	| hd1 hd2 hd3 |
	hd1 := DieHandle new
		addDie: (Die withFaces: 20);
		addDie: (Die withFaces: 20);
		yourself.
	hd2 := DieHandle new
		addDie: (Die withFaces: 10);
		addDie: (Die withFaces: 10);
		yourself.
	hd3 := hd1 + hd2.
	self assert: hd3 diceNumber equals: 4
]

{ #category : 'tests' }
DieHandleTest >> testSumming [
	| handle |
	handle := 2 D20 + 3 D10.
	self assert: handle diceNumber equals: 5
]

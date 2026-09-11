Class {
	#name : 'DieHandle',
	#superclass : 'Object',
	#instVars : [
		'dice'
	],
	#category : 'Dice',
	#package : 'Dice'
}

{ #category : 'arithmetic' }
DieHandle >> + aDieHandle [
	| handle |
	handle := self class new.
	self dice do: [ :each | handle addDie: each ].
	aDieHandle dice do: [ :each | handle addDie: each ].
	^ handle
]

{ #category : 'adding' }
DieHandle >> addDie: aDie [
	dice add: aDie
]

{ #category : 'accessing' }
DieHandle >> dice [
	^ dice
]

{ #category : 'as yet unclassified' }
DieHandle >> diceNumber [
	^ dice size
]

{ #category : 'initialization' }
DieHandle >> initialize [
	super initialize.
	dice := OrderedCollection new
]

{ #category : 'as yet unclassified' }
DieHandle >> roll [
	| res |
	res := 0.
	dice do: [ :each | res := res + each roll ].
	^ res
]

Class {
	#name : 'CounterTest',
	#superclass : 'TestCase',
	#category : 'MyCounter',
	#package : 'MyCounter'
}

{ #category : 'tests' }
CounterTest >> testAlternateCreationMethod [
	self assert: ((Counter startingAt: 19) increment count) equals: 20
]

{ #category : 'tests' }
CounterTest >> testCounterStartingAt5 [
	self assert: (Counter startingAt: 5) count equals: 5
]

{ #category : 'tests' }
CounterTest >> testDecrement [
	| c |
	c := Counter new.
	c count: 4.
	c decrement.
	self assert: c count equals: 3
]

{ #category : 'tests' }
CounterTest >> testIncrement [
	| c |
	c := Counter new.
	c count: 2.
	c increment.
	self assert: c count equals: 3
]

{ #category : 'tests' }
CounterTest >> testInitialize [
	| c |
	c := Counter new.
	self assert: c count equals: 0
]

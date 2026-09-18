Class {
	#name : 'MyPawn',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'as yet unclassified' }
MyPawn >> diagonalSquares [
	| baseSquare |
	baseSquare := self forwardSquare.
	baseSquare ifNil: [ ^ #() ].
	^ { baseSquare left . baseSquare right } select: #notNil
]

{ #category : 'as yet unclassified' }
MyPawn >> forwardSquare [
	^ self isWhite
		ifTrue: [ square up ]
		ifFalse: [ square down ]
]

{ #category : 'accessing' }
MyPawn >> id [

	^ 'P'
]

{ #category : 'rendering' }
MyPawn >> renderPieceOn: aSquare [ 
	
	^ aSquare renderPawn: self
]

{ #category : 'rendering' }
MyPawn >> targetSquaresLegal: aBoolean [
	| targets |
	targets := OrderedCollection new.

	self forwardSquare ifNotNil: [ :fwd |
		fwd hasPiece ifFalse: [ targets add: fwd ] ].

	self diagonalSquares do: [ :diag |
		(diag hasPiece and: [ diag contents color ~= color ])
			ifTrue: [ targets add: diag ] ].

	^ targets
]

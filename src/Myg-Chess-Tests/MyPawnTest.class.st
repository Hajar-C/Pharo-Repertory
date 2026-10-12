Class {
	#name : 'MyPawnTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPawnTest >> testWhitePawnCanCaptureDiagonallyEnemyPiece [
	| pawn board enemyPiece |
	board := MyChessBoard empty.
	pawn := MyPawn white.
	enemyPiece := MyPawn black.
	board at: 'e2' put: pawn.
	board at: 'd3' put: enemyPiece.
	
	self assert: (pawn targetSquares includes: (board at: 'd3'))
]

{ #category : 'tests' }
MyPawnTest >> testWhitePawnCanMoveOneSquareForward [
	| pawn board |
	board := MyChessBoard empty.
	pawn := MyPawn white.
	board at: 'e2' put: pawn.
	
	self assert: (pawn targetSquares includes: (board at: 'e3'))
]

{ #category : 'tests' }
MyPawnTest >> testWhitePawnCannotMoveDiagonallyToEmptySquare [
	| pawn board |
	board := MyChessBoard empty.
	pawn := MyPawn white.
	board at: 'e2' put: pawn.
	
	self deny: (pawn targetSquares includes: (board at: 'd3')).
	self deny: (pawn targetSquares includes: (board at: 'f3'))
]

{ #category : 'tests' }
MyPawnTest >> testWhitePawnCannotMoveForwardIfBlocked [
	| pawn board blockingPiece |
	board := MyChessBoard empty.
	pawn := MyPawn white.
	blockingPiece := MyPawn black.
	board at: 'e2' put: pawn.
	board at: 'e3' put: blockingPiece.
	
	self deny: (pawn targetSquares includes: (board at: 'e3'))
]

{ #category : 'tests' }
MyPawnTest >> testWhitePawnInitialTwoSquareMove [
	"test if the pawn can move correctly"

	| pawn board |
	board := MyChessBoard empty.
	pawn := MyPawn white.
	board at: 'e2' put: pawn.
	self assert: (pawn targetSquares includes: (board at: 'e4'))
	
]

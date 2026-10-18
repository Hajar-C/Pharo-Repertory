Class {
	#name : 'FSDirectory',
	#superclass : 'FSEntry',
	#instVars : [
		'children'
	],
	#category : 'FS',
	#package : 'FS'
}

{ #category : 'visiting' }
FSDirectory >> acceptVisitor: aVisitor [
	"Appelle the visitor for a directory"
	^ aVisitor visitDirectory: self
]

{ #category : 'adding' }
FSDirectory >> add: anEntry [
"ajouter des elements (fichiers ou repertoires) et enregistrer self as the parent "
children add: anEntry. 
anEntry parent: self
]

{ #category : 'accessing' }
FSDirectory >> children [
"getter"
^children 
]

{ #category : 'initialization' }
FSDirectory >> initialize [ 
"initialisation de la collection de childrens"
	super initialize.
	children := OrderedCollection new 
]

{ #category : 'as yet unclassified' }
FSDirectory >> searchByContents: aString [
	"Recursively collects matching files from children"
	| results |
	results := OrderedCollection new.
	children do: [ :each | 
		results addAll: (each searchByContents: aString) ].
	^ results
]

{ #category : 'as yet unclassified' }
FSDirectory >> searchByName: aString [
	"Recursively collects self if matching and all matching children"
	| results |
	results := OrderedCollection new.
	(self matchesName: aString) ifTrue: [ results add: self ].
	children do: [ :each | 
		results addAll: (each searchByName: aString) ].
	^ results
]

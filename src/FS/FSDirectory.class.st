Class {
	#name : 'FSDirectory',
	#superclass : 'FSEntry',
	#instVars : [
		'children'
	],
	#category : 'FS',
	#package : 'FS'
}

{ #category : 'adding' }
FSDirectory >> add: anEntry [
"ajouter des elements (fichiers ou repertoires)"
children add: anEntry 

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
"la meme chose que fs file mais cherche dans les childrens"
| myResults childrenResults |
	myResults := (self name = aString)
		ifTrue: [ { self } ]
		ifFalse: [ #( ) ].
	childrenResults := children flatCollect: [ :each | each searchByName: aString ].
	^ myResults , childrenResults
]

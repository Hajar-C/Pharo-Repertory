Class {
	#name : 'FSFile',
	#superclass : 'FSEntry',
	#instVars : [
		'contents'
	],
	#category : 'FS',
	#package : 'FS'
}

{ #category : 'accessing' }
FSFile >> contents [
	"getter for content of the file"
^contents 
]

{ #category : 'accessing' }
FSFile >> contents: aString [
	"setter for content of the file"
	contents := aString 
]

{ #category : 'initialization' }
FSFile >> initialize [
	"Initializes default empty text contents"
	super initialize.
	contents := ''
]

{ #category : 'as yet unclassified' }
FSFile >> searchByContents: aString [
	"Returns self in a collection if content matches, empty collection otherwise"
	(contents includesSubstring: aString)
		ifTrue: [ ^ OrderedCollection with: self ].
	^ OrderedCollection new
]

{ #category : 'as yet unclassified' }
FSFile >> searchByName: aString [
	"Returns self in a collection if name matches prefix empty otherwise"
	(self matchesName: aString)
		ifTrue: [ ^ OrderedCollection with: self ].
	^ OrderedCollection new
]

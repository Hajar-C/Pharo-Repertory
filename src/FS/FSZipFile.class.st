Class {
	#name : 'FSZipFile',
	#superclass : 'FSFile',
	#instVars : [
		'children'
	],
	#category : 'FS',
	#package : 'FS'
}

{ #category : 'visiting' }
FSZipFile >> acceptVisitor: aVisitor [
	"Dispatches to zip file visit method"
	^ aVisitor visitZipFile: self
]

{ #category : 'adding' }
FSZipFile >> add: anEntry [
	"Adds entry and updates parent linkage"
	children add: anEntry.
	anEntry parent: self.
	^ anEntry
]

{ #category : 'accessing' }
FSZipFile >> children [
	"Getter for compressed collection"
	^ children
]

{ #category : 'initialization' }
FSZipFile >> initialize [
	"Initializes collection"
	super initialize.
	children := OrderedCollection new
]

Class {
	#name : 'FSVisitor',
	#superclass : 'Object',
	#category : 'FS',
	#package : 'FS'
}

{ #category : 'visiting' }
FSVisitor >> visitDirectory: aDirectory [
	"Visit directory"
	self subclassResponsibility
]

{ #category : 'visiting' }
FSVisitor >> visitFile: aFile [
	"Visit file"
	self subclassResponsibility
]

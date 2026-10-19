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

{ #category : 'visiting' }
FSVisitor >> visitSymlink: aSymlink [
	"Default fallback: delegates to pointed target"
	^ aSymlink target acceptVisitor: self
]

{ #category : 'visiting' }
FSVisitor >> visitZipFile: aZipFile [
	"Default fallback: treated as a directory"
	^ self visitDirectory: aZipFile
]

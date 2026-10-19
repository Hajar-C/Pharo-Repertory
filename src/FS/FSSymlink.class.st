Class {
	#name : 'FSSymlink',
	#superclass : 'FSEntry',
	#instVars : [
		'target'
	],
	#category : 'FS',
	#package : 'FS'
}

{ #category : 'visiting' }
FSSymlink >> acceptVisitor: aVisitor [
	"Dispatches to symlink visit method"
	^ aVisitor visitSymlink: self
]

{ #category : 'as yet unclassified' }
FSSymlink >> searchByContents: aString [
	^ target searchByContents: aString
]

{ #category : 'as yet unclassified' }
FSSymlink >> searchByName: aString [
	^ target searchByName: aString
]

{ #category : 'accessing' }
FSSymlink >> target [
	"Getter"
	^ target
]

{ #category : 'accessing' }
FSSymlink >> target: anEntry [
	"Setter"
	target := anEntry
]

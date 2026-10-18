Class {
	#name : 'FSEntry',
	#superclass : 'Object',
	#instVars : [
		'name',
		'parent'
	],
	#category : 'FS',
	#package : 'FS'
}

{ #category : 'visiting' }
FSEntry >> acceptVisitor: aVisitor [
	"Point d'entrée"
	self subclassResponsibility
]

{ #category : 'testing' }
FSEntry >> matchesName: aString [
	"Indicates if name starts with the prefix"
	^ self name beginsWith: aString

]

{ #category : 'accessing' }
FSEntry >> name [
	"Getter de la classe name"
^name 

]

{ #category : 'accessing' }
FSEntry >> name: aString [
	"Setter de la methode name"
	name := aString
]

{ #category : 'accessing' }
FSEntry >> parent [
	"Returns parent , getter"
	^ parent
]

{ #category : 'accessing' }
FSEntry >> parent: aDirectory [
	"Sets the parent directory"
	parent := aDirectory
]

{ #category : 'accessing' }
FSEntry >> path [
	"Computes full slash-separated path from the root"
	parent ifNil: [ ^ '/' , self name ].
	^ parent path , '/' , self name
]

{ #category : 'as yet unclassified' }
FSEntry >> searchByContents: aString [ 
	^ self subclassResponsibility
]

{ #category : 'as yet unclassified' }
FSEntry >> searchByName: aString [ 
	^ self subclassResponsibility
]

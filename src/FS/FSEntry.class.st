Class {
	#name : 'FSEntry',
	#superclass : 'Object',
	#instVars : [
		'name'
	],
	#category : 'FS',
	#package : 'FS'
}

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

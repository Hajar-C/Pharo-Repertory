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

{ #category : 'as yet unclassified' }
FSFile >> searchByName: aString [
"renvoie une collection qui contien tout les fichiers qui sont nommer ca "
	^ { self } select: [ :each | each name = aString ]
]

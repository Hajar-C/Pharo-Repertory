Class {
	#name : 'FSSizeVisitor',
	#superclass : 'FSVisitor',
	#category : 'FS',
	#package : 'FS'
}

{ #category : 'visiting' }
FSSizeVisitor >> visitDirectory: aDirectory [
	"Sums size of all children entries and returns contents length in number of characters"
	| total |
	total := 0.
	aDirectory children do: [ :each | 
		total := total + (each acceptVisitor: self) ].
	^ total
]

{ #category : 'visiting' }
FSSizeVisitor >> visitFile: aFile [
	"Returns contents length in number of characters"
	^ aFile contents size
]

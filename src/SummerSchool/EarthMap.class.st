Class {
	#name : 'EarthMap',
	#superclass : 'Object',
	#instVars : [
		'countries'
	],
	#category : 'SummerSchool',
	#package : 'SummerSchool'
}

{ #category : 'accessing' }
EarthMap >> countries [
	^ countries
]

{ #category : 'as yet unclassified' }
EarthMap >> importCountriesFrom: aFileName [
	(self xmlTreeFromFile: aFileName) nodes first nodes do: [ :node |
		node class = XMLElement ifTrue: [
			self importCountryFromXMLNode: node ] ]
]

{ #category : 'as yet unclassified' }
EarthMap >> importCountryFromXMLNode: aXMLElement [
	countries add: (EarthMapCountry new fromXML: aXMLElement)
]

{ #category : 'initialization' }
EarthMap >> initialize [
	super initialize.
	countries := OrderedCollection new
]

{ #category : 'as yet unclassified' }
EarthMap >> openPopulatedCanvas [
	self populatedCanvas open
]

{ #category : 'as yet unclassified' }
EarthMap >> populatedCanvas [
	^ RSCanvas new
		addAll: (countries collect: [ :country | country asRSShape ]);
		@ RSCanvasController;
		yourself
]

{ #category : 'as yet unclassified' }
EarthMap >> xmlTreeFromFile: aFileName [
	^ aFileName asFileReference readStreamDo: [ :stream |
		(XMLDOMParser parse: stream) document ]
]

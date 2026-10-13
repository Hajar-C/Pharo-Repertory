Class {
	#name : 'FSEntryTest',
	#superclass : 'TestCase',
	#instVars : [
		'root',
		'folder1',
		'fileA',
		'fileB',
		'hiddenFile'
	],
	#category : 'FS',
	#package : 'FS'
}

{ #category : 'running' }
FSEntryTest >> setUp [
	"Prepares a test hierarchy using setters."
	super setUp.
	root := FSDirectory new.
	root name: 'root'.

	folder1 := FSDirectory new.
	folder1 name: 'folder1'.

	fileA := FSFile new.
	fileA name: 'fileA.txt'.

	fileB := FSFile new.
	fileB name: 'fileB.txt'.

	hiddenFile := FSFile new.
	hiddenFile name: '.secret'.

	root add: folder1.
	root add: fileA.
	folder1 add: fileB.
	folder1 add: hiddenFile
]

{ #category : 'tests' }
FSEntryTest >> testPath [
	"Verifies path construction from root"
	self assert: root path equals: '/root'.
	self assert: fileA path equals: '/root/fileA.txt'.
	self assert: fileB path equals: '/root/folder1/fileB.txt'
]

{ #category : 'tests' }
FSEntryTest >> testSearchByContents [
	"Verifies finding a file whose contents match the given query."
	| results |
	fileA contents: 'Hello Smalltalk world'.

	results := root searchByContents: 'Smalltalk'.
	self assert: results size equals: 1.
	self assert: results first equals: fileA
]

{ #category : 'tests' }
FSEntryTest >> testSearchByContentsNotFound [
	"Verifies returning an empty collection when no content matches."
	fileA contents: 'Hello Smalltalk world'.

	self assert: (root searchByContents: 'absent') isEmpty
]

{ #category : 'tests' }
FSEntryTest >> testSearchByContentsOnFileDirectly [
	"Verifies searchByContents: invoked directly on a leaf file"
	fileA contents: 'Pharo rocks'.

	self assert: (fileA searchByContents: 'rocks') size equals: 1.
	self assert: (fileA searchByContents: 'inexistant') isEmpty
]

{ #category : 'tests' }
FSEntryTest >> testSearchByName [
	"Verifies recursive search returning the given name."
	| results |
	results := root searchByName: 'fileB.txt'.
	self assert: results size equals: 1.
	self assert: results first equals: fileB.

	self assert: (root searchByName: 'introuvable') isEmpty
]

{ #category : 'tests' }
FSEntryTest >> testSearchByNameMultipleResults [
	"Verifies collecting multiple files sharing the same name in different directories."
	| results duplicateFile |
	duplicateFile := FSFile new.
	duplicateFile name: 'fileA.txt'.
	folder1 add: duplicateFile.

	results := root searchByName: 'fileA.txt'.
	self assert: results size equals: 2.
	self assert: (results includes: fileA).
	self assert: (results includes: duplicateFile)
]

{ #category : 'tests' }
FSEntryTest >> testSearchByNameNotFound [
	"Verifies returning an empty collection when no entry matches."
	self assert: (root searchByName: 'inexistant.txt') isEmpty
]

{ #category : 'tests' }
FSEntryTest >> testSearchByNameOnFileDirectly [
	"Verifies polymorphic search invoked directly on a leaf file."
	self assert: (fileA searchByName: 'fileA.txt') size equals: 1.
	self assert: (fileA searchByName: 'autre.txt') isEmpty
]

{ #category : 'tests' }
FSEntryTest >> testSearchByNamePrefix [
	"Verifies that searching by name matches entries starting with the prefix"
	| results |
	results := root searchByName: 'file'.
	self assert: results size equals: 2.
	self assert: (results includes: fileA).
	self assert: (results includes: fileB)
]

{ #category : 'tests' }
FSEntryTest >> testSearchByNameSingleResult [
	"Verifies recursive search returning the given name."
	| results |
	results := root searchByName: 'fileB.txt'.
	self assert: results size equals: 1.
	self assert: results first equals: fileB.
]

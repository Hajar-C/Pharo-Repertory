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
FSEntryTest >> testSearchByNameSingleResult [
	"Verifies recursive search returning the given name."
	| results |
	results := root searchByName: 'fileB.txt'.
	self assert: results size equals: 1.
	self assert: results first equals: fileB.
]

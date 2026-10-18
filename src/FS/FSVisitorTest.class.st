Class {
	#name : 'FSVisitorTest',
	#superclass : 'TestCase',
	#instVars : [
		'root',
		'folder1',
		'fileA',
		'fileB'
	],
	#category : 'FS',
	#package : 'FS'
}

{ #category : 'running' }
FSVisitorTest >> setUp [
	"Prepares a test hierarchy using setters"
	super setUp.
	root := FSDirectory new.
	root name: 'root'.

	folder1 := FSDirectory new.
	folder1 name: 'folder1'.

	fileA := FSFile new.
	fileA name: 'fileA.txt'.
	fileA contents: 'abc'.

	fileB := FSFile new.
	fileB name: 'fileB.txt'.
	fileB contents: '12345'.

	root add: folder1.
	root add: fileA.
	folder1 add: fileB
]

{ #category : 'tests' }
FSVisitorTest >> testSizeVisitorOnDirectory [
	"Verifies computing recursive size across directories"
	| visitor |
	visitor := FSSizeVisitor new.
	self assert: (folder1 acceptVisitor: visitor) equals: 5
]

{ #category : 'tests' }
FSVisitorTest >> testSizeVisitorOnRootHierarchy [
	"Verifies computing total size of the entire tree"
	| visitor |
	visitor := FSSizeVisitor new.
	self assert: (root acceptVisitor: visitor) equals: 8
]

{ #category : 'tests' }
FSVisitorTest >> testSizeVisitorOnSingleFile [
	"Verifies computing size of a single file in characters"
	| visitor |
	visitor := FSSizeVisitor new.
	self assert: (fileA acceptVisitor: visitor) equals: 3
]

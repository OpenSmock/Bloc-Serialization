Class {
	#name : #BlocSerializationIdentificationTests,
	#superclass : #BlocSerializationTests,
	#category : #'Bloc-Serialization-Tests-Core'
}

{ #category : #tests }
BlocSerializationIdentificationTests >> testIdentityHash [

	| element newElement |
	element := BlElement new.
	newElement := self serializeThenMaterialize: element.
	
	self deny: element identityHash equals: newElement identityHash.
]

{ #category : #tests }
BlocSerializationIdentificationTests >> testNamedId [

	| origin |
	origin := BlElement new id: #test.

	self
		test: origin
		on: [ :element | self assert: element id identifier equals: #test ]
]

{ #category : #tests }
BlocSerializationIdentificationTests >> testNamedIndexedId [

	| origin |
	origin := BlElement new
		          id: ((BlElementId named: #test) indexed: 1);
		          yourself.

	self
		test: origin
		on: [ :element | self assert: element id prefixId identifier equals: #test. self assert: element id index equals: 1.  self assert: element id  equals: ((BlElementId named: #test) indexed: 1).]
]

{ #category : #tests }
BlocSerializationIdentificationTests >> testNoId1 [

	| origin |
	origin := BlElement new.

	self test: origin on: [ :element | 
		self
			assert: element id
			equals: BlElementNoId uniqueInstance ]
]

{ #category : #tests }
BlocSerializationIdentificationTests >> testNoId2 [

	| origin |
	origin := BlElement new id: BlElementId noId.

	self test: origin on: [ :element | 
		self assert: element id equals: BlElementNoId uniqueInstance ]
]

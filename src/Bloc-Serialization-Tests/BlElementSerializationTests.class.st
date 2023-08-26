Class {
	#name : #BlElementSerializationTests,
	#superclass : #TestCase,
	#category : #'Bloc-Serialization-Tests-Extensions'
}

{ #category : #tests }
BlElementSerializationTests >> testSerialize [

	| string |
	string := BlElement new serialize.
	self assert: string isString
]

{ #category : #tests }
BlElementSerializationTests >> testSerializeThenMaterialize [

	| element newElement |
	element := BlElement new.
	newElement := element serializeThenMaterialize.
	
	self assert: element class equals: newElement class.
]

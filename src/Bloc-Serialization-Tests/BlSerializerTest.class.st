"
A BlSerializerTest is a test class for testing the behavior of BlSerializer
"
Class {
	#name : #BlSerializerTest,
	#superclass : #TestCase,
	#category : #'Bloc-Serialization-Tests-Core'
}

{ #category : #tests }
BlSerializerTest >> testMaterializeEmptyString [

	| error blElement |
	error := nil.

	[ blElement := BlSerializer materialize: '' ]
		onErrorDo: [ :e | error := e ].

	self assert: (error isKindOf: BlocMaterializationError)
]

{ #category : #tests }
BlSerializerTest >> testMaterializeNilString [

	| blElement error |
	error := nil.

	[ blElement := 'nil' materializeAsBlElement ]
		onErrorDo: [ :e | error := e ].

	self assert: (error isKindOf: BlocMaterializationError)
]

{ #category : #tests }
BlSerializerTest >> testMaterializeNotSerializedString [

	| blElement error |
	error := nil.

	[ blElement := 'Not a serialized String' materializeAsBlElement ]
		onErrorDo: [ :e | error := e ].

	self assert: (error isKindOf: BlocMaterializationError)
]

{ #category : #tests }
BlSerializerTest >> testSerialize [

	| string |
	string := BlSerializer serialize: BlElement new.
	self assert: string isString
]

{ #category : #tests }
BlSerializerTest >> testSerializeNilObject [

	| error blElement |
	error := nil.

	[ blElement := BlSerializer serialize: nil ]
		onErrorDo: [ :e | error := e ].

	self assert: (error isKindOf: BlocSerializationError)
]

{ #category : #tests }
BlSerializerTest >> testSerializeNoBlElement [

	| error |
	error := nil.

	[ BlSerializer serialize: (String new) ]
		onErrorDo: [ :e | error := e ].

	self assert: (error isKindOf: BlocSerializationError)
]

{ #category : #tests }
BlSerializerTest >> testSerializeThenMaterialize [

	| string blElement |
	string := BlSerializer serialize: BlElement new.
	blElement := string materializeAsBlElement.
	self assert: (blElement isKindOf: BlElement)
]

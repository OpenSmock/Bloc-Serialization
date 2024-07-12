"
A BlSerializerTest is a test class for testing the behavior of BlSerializer
"
Class {
	#name : 'BlSerializerTest',
	#superclass : 'TestCase',
	#category : 'Bloc-Serialization-Tests-Core',
	#package : 'Bloc-Serialization-Tests',
	#tag : 'Core'
}

{ #category : 'tests' }
BlSerializerTest >> testMaterializeEmptyString [

	| error blElement |
	error := nil.

	[ blElement := BlSerializer materialize: '' ]
		onErrorDo: [ :e | error := e ].

	self assert: (error isKindOf: BlocMaterializationError)
]

{ #category : 'tests' }
BlSerializerTest >> testMaterializeNilString [

	| blElement error |
	error := nil.

	[ blElement := 'nil' materializeAsBlElement ]
		onErrorDo: [ :e | error := e ].

	self assert: (error isKindOf: BlocMaterializationError)
]

{ #category : 'tests' }
BlSerializerTest >> testMaterializeNotSerializedString [

	| blElement error |
	error := nil.

	[ blElement := 'Not a serialized String' materializeAsBlElement ]
		onErrorDo: [ :e | error := e ].

	self assert: (error isKindOf: BlocMaterializationError)
]

{ #category : 'tests' }
BlSerializerTest >> testSerialize [

	| string |
	string := BlSerializer serialize: BlElement new.
	self assert: string isString
]

{ #category : 'tests' }
BlSerializerTest >> testSerializeBlElementCollection [
	| error result oc oc2 |

	"Empty Collection"
	error := nil. result := nil.
	[ result := BlSerializer serialize: OrderedCollection new ] onErrorDo: [ :e | error := e ].
	self deny: (error isKindOf: BlocSerializationError). "this test is ok because of a empty string is an empty collection"
	
	error := nil. result := nil.
	oc := OrderedCollection new.
	oc add: BlElement new; add: BlElement new; add: BlElement new.
	[ result := BlSerializer serialize: oc ] onErrorDo: [ :e | error := e ].
	self deny: (error isKindOf: BlocSerializationError). "this test is ok because of a empty string is an empty collection"
	oc2 := result materializeAsBlElement.
	self assert: oc2 size equals: 3.
	self assert: (oc2 allSatisfy: [ :e | e class = BlElement ]).
]

{ #category : 'tests' }
BlSerializerTest >> testSerializeNilObject [

	| error blElement |
	error := nil.

	[ blElement := BlSerializer serialize: nil ]
		onErrorDo: [ :e | error := e ].

	self assert: (error isKindOf: BlocSerializationError)
]

{ #category : 'tests' }
BlSerializerTest >> testSerializeNoBlElement [
	| error result |

	"Not a supported collection"
	error := nil. result := nil.
	[ result := BlSerializer serialize: String new ] onErrorDo: [ :e | error := e ].
	self assert: (error isKindOf: BlocSerializationError). "this test is ok because of a empty string is an empty collection"
	
	"Not a supported collection"
	error := nil. result := nil.
	[ result := BlSerializer serialize: 'Not a supported collection' ] onErrorDo: [ :e | error := e ].
	self assert: (error isKindOf: BlocSerializationError). 
	
	"Not a supported collection"
	error := nil. result := nil.
	[ result := BlSerializer serialize: #(1 2 3)] onErrorDo: [ :e | error := e ].
	self assert: (error isKindOf: BlocSerializationError).
	
	"Not a supported collection"
	error := nil. result := nil.
	[ result := BlSerializer serialize: Dictionary new ] onErrorDo: [ :e | error := e ].
	self assert: (error isKindOf: BlocSerializationError). "this test is ok because of a empty string is an empty collection"
]

{ #category : 'tests' }
BlSerializerTest >> testSerializeThenMaterialize [

	| string blElement |
	string := BlSerializer serialize: BlElement new.
	blElement := string materializeAsBlElement.
	
	self assert: blElement class equals: BlElement
]

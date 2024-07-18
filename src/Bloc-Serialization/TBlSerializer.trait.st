Trait {
	#name : #TBlSerializer,
	#category : #'Bloc-Serialization-Core'
}

{ #category : #serialization }
TBlSerializer classSide >> materialize: aString [
	"Materialize a String into a BlElement and return it. Default materializer is STON."
	| blElement |
	aString isString not ifTrue:[ BlocMaterializationError signal: 'Cannot materialize a no String object into BlElement' ].
	"Try to materialize and catch an error into a BlocMaterialization error"
	[ blElement := self materializeImplementation: aString ] onErrorDo: [ :e | BlocMaterializationError signal: 'Cannot support Bloc materialization of this String (', e asString, ')' ].
	blElement ifNil:[ BlocMaterializationError signal: 'Bloc materialization result is nil' ].

	^ blElement
]

{ #category : #serialization }
TBlSerializer classSide >> serialize: aBlElementOrABlElementsCollection [
	"Serialize a BlElement or a list of BlElements into a String using a serializer. Default serializer is STON."

	| string |
	aBlElementOrABlElementsCollection isCollection 
		ifTrue: [ self verifyCollection: aBlElementOrABlElementsCollection ] 
		ifFalse: [ self verifyElement: aBlElementOrABlElementsCollection ].
	
	"Try to serialize and catch an error into a BlocSerialization error"
	[ string := self serializeImplementation: aBlElementOrABlElementsCollection ] onErrorDo: [ :e | BlocSerializationError signal: 'Cannot support serialization of this BlElement (', e asString, ')' ].

	^ string
]

{ #category : #'as yet unclassified' }
TBlSerializer classSide >> verifyCollection: aCollection [

	"Check if the collection is supported : can contains some BlElements"
	aCollection isString ifTrue:[ 
		BlocSerializationError signal: 'Cannot serialize a String'
	].

	aCollection isDictionary ifTrue:[
		BlocSerializationError signal: 'Cannot serialize a Dictionary'	
	].

	aCollection do: [ :each | self verifyElement: each ]
]

{ #category : #'as yet unclassified' }
TBlSerializer classSide >> verifyElement: aBlElement [

	(aBlElement isKindOf: BlElement) ifFalse: [
		BlocSerializationError signal:
			'Cannot serialize an objet which is not from BlElement class hierarchy' ]
]

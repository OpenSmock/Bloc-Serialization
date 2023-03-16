"
Serailizer class for Bloc
"
Class {
	#name : #BlSerializer,
	#superclass : #Object,
	#category : #'Bloc-Serialization-Core'
}

{ #category : #serialization }
BlSerializer class >> materialize: aString [
	"Materialize a String into a BlElement and return it. Default materializer is STON."
	| blElement |
	aString isString not ifTrue:[ BlocMaterializationError signal: 'Cannot materialize a no String object into BlElement' ].
	"Try to materialize and catch an error into a BlocMaterialization error"
	[ blElement := STON fromString: aString ] onErrorDo: [ :e | BlocMaterializationError signal: 'Cannot support Bloc materialization of this String (', e asString, ')' ].
	blElement ifNil:[ BlocMaterializationError signal: 'Bloc materialization result is nil' ].

	^ blElement
]

{ #category : #serialization }
BlSerializer class >> serialize: aBlElement [
	"Serialize a BlElement into a String using a serializer. Default serializer is STON."

	| string |
	(aBlElement isKindOf: BlElement) ifFalse:[ BlocSerializationError signal: 'Cannot serialize an objet which is not from BlElement class hierarchy' ].
	"Try to serialize and catch an error into a BlocSerialization error"
	[ string := STON toStringPretty: aBlElement ] onErrorDo: [ :e | BlocSerializationError signal: 'Cannot support serialization of this BlElement (', e asString, ')' ].

	^ string
]

{ #category : #'see class side' }
BlSerializer >> seeClassSide [
]

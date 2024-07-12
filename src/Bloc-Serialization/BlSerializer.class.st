"
Serailizer class for Bloc
"
Class {
	#name : 'BlSerializer',
	#superclass : 'Object',
	#classInstVars : [
		'serializer'
	],
	#category : 'Bloc-Serialization-Core',
	#package : 'Bloc-Serialization',
	#tag : 'Core'
}

{ #category : 'serialization' }
BlSerializer class >> materialize: aString [
	"Materialize a String into a BlElement and return it. Default materializer is STON."

	| serializerClassName serializerClass |
	aString ifEmpty: [ ^ BlocMaterializationError new signal ].
	aString first = $" ifFalse: [
		^ BlStonSerializer materialize: aString ].
	serializerClassName := aString lines first allButFirst allButLast.
	serializerClass := Smalltalk environment classNamed:
		                   serializerClassName.
	^ serializerClass materialize: ('' join: aString lines allButFirst)
]

{ #category : 'initialization' }
BlSerializer class >> reset [

	<script>
	serializer := nil
]

{ #category : 'serialization' }
BlSerializer class >> serialize: aBlElementOrABlElementsCollection [
	"Serialize a BlElement or a list of BlElements into a String using a serializer. Default serializer is STON."

	^ self serialize: aBlElementOrABlElementsCollection with: self serializer
]

{ #category : 'serialization' }
BlSerializer class >> serialize: aBlElementOrABlElementsCollection with: aBlSerializer [
	"Serialize a BlElement or a list of BlElements into a String using a serializer. Default serializer is STON."

	| string |
	string := aBlSerializer serialize:
		          aBlElementOrABlElementsCollection.
	^ '"<1s>"<r><2s>' expandMacrosWith: aBlSerializer name with: string
]

{ #category : 'accessing' }
BlSerializer class >> serializer [

	serializer ifNil: [ serializer := BlStashSerializer ].
	^ serializer
]

{ #category : 'as yet unclassified' }
BlSerializer class >> verifyCollection: aCollection [

	"Check if the collection is supported : can contains some BlElements"
	aCollection isString ifTrue:[ 
		BlocSerializationError signal: 'Cannot serialize a String'
	].

	aCollection isDictionary ifTrue:[
		BlocSerializationError signal: 'Cannot serialize a Dictionary'	
	].

	aCollection do: [ :each | self verifyElement: each ]
]

{ #category : 'as yet unclassified' }
BlSerializer class >> verifyElement: aBlElement [

	(aBlElement isKindOf: BlElement) ifFalse: [
		BlocSerializationError signal:
			'Cannot serialize an objet which is not from BlElement class hierarchy' ]
]

{ #category : 'see class side' }
BlSerializer >> seeClassSide [
]

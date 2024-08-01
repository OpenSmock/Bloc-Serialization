"
Serailizer class for Bloc
"
Class {
	#name : #BlSerializer,
	#superclass : #Object,
	#classTraits : 'TBlSerializer classTrait',
	#classInstVars : [
		'serializer'
	],
	#category : #'Bloc-Serialization-Core'
}

{ #category : #'as yet unclassified' }
BlSerializer class >> allSerializer [

	^ TBlSerializer users
]

{ #category : #serialization }
BlSerializer class >> materialize: anObject [

	| serializerClassName serializerClass |
	(anObject isKindOf: BlElement) ifTrue: [ ^ anObject ].
	anObject ifEmpty: [ ^ BlocMaterializationError new signal ].

	anObject first = $" ifFalse: [
		^ self unknownMaterializerFor: anObject ].

	serializerClassName := anObject lines first allButFirst allButLast.
	serializerClass := Smalltalk environment classNamed:
		                   serializerClassName.
	serializerClass ifNil: [ ^ self unknownMaterializerFor: anObject ].

	^ serializerClass materialize: ('' join: anObject lines allButFirst)
]

{ #category : #initialization }
BlSerializer class >> reset [

	<script>
	serializer := nil
]

{ #category : #serialization }
BlSerializer class >> serialize: aBlElementOrABlElementsCollection [
	"Serialize a BlElement or a list of BlElements into a String using a serializer. Default serializer is STON."

	^ self serialize: aBlElementOrABlElementsCollection with: self serializer
]

{ #category : #serialization }
BlSerializer class >> serialize: aBlElementOrABlElementsCollection with: aBlSerializer [
	"Serialize a BlElement or a list of BlElements into a String using a serializer. Default serializer is STON."

	| string |
	string := aBlSerializer serialize:
		          aBlElementOrABlElementsCollection.
	^ '"<1s>"<r><2s>' expandMacrosWith: aBlSerializer name with: string
]

{ #category : #accessing }
BlSerializer class >> serializer [

	serializer ifNil: [ serializer := BlStashSerializer ].
	^ serializer
]

{ #category : #serialization }
BlSerializer class >> unknownMaterializerFor: aString [

	self allSerializer do: [ :each |
		[ ^ each materialize: aString ]
			on: BlocMaterializationError
			do: [  ] ].
	BlocMaterializationError signal: 'Could not find a Serializer.'
]

{ #category : #'see class side' }
BlSerializer >> seeClassSide [
]

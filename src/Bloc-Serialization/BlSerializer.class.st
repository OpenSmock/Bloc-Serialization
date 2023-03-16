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

	^ STON fromString: aString
]

{ #category : #serialization }
BlSerializer class >> serialize: aBlElement [

	^ STON toStringPretty: aBlElement
]

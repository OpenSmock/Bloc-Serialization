Class {
	#name : #BlSerializerSTON,
	#superclass : #BlSerializer,
	#category : #'Bloc-Serialization-Core'
}

{ #category : #serialization }
BlSerializerSTON class >> materialize: aString [

	^ STON fromString: aString
]

{ #category : #serialization }
BlSerializerSTON class >> serialize: aBlElement [

	^ STON toStringPretty: aBlElement
]

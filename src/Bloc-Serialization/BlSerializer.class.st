Class {
	#name : #BlSerializer,
	#superclass : #Object,
	#category : #'Bloc-Serialization-Core'
}

{ #category : #serialization }
BlSerializer class >> materialize: aString [

	^ BlSTON fromString: aString
]

{ #category : #serialization }
BlSerializer class >> serialize: aBlElement [

	^ BlSTON toStringPretty: aBlElement
]

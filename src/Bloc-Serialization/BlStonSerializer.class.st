"
Serailizer class for Bloc
"
Class {
	#name : #BlStonSerializer,
	#superclass : #Object,
	#traits : 'TBlSerializer',
	#classTraits : 'TBlSerializer classTrait',
	#category : #'Bloc-Serialization-Core'
}

{ #category : #'as yet unclassified' }
BlStonSerializer class >> materializeImplementation: anObject [

	^ STON fromString: anObject
]

{ #category : #'as yet unclassified' }
BlStonSerializer class >> serializeImplementation: anObject [

	^ STON toStringPretty: anObject
]

{ #category : #'see class side' }
BlStonSerializer >> seeClassSide [
]

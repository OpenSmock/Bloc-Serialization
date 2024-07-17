"
Serailizer class for Bloc
"
Class {
	#name : #BlStashSerializer,
	#superclass : #Object,
	#traits : 'TBlSerializer',
	#classTraits : 'TBlSerializer classTrait',
	#category : #'Bloc-Serialization-Core'
}

{ #category : #'as yet unclassified' }
BlStashSerializer class >> materializeImplementation: anObject [

	^ Stash new materialize: anObject
]

{ #category : #'as yet unclassified' }
BlStashSerializer class >> serializeImplementation: anObject [

	^ Stash new serialize: anObject
]

{ #category : #'see class side' }
BlStashSerializer >> seeClassSide [
]

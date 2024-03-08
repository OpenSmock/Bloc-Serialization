"
This BlELement is a used for testing the no serialization of children.
"
Class {
	#name : #BlTestShouldNotSerializedChildrenElement,
	#superclass : #BlElement,
	#category : #'Bloc-Serialization-Tests-Core'
}

{ #category : #asserting }
BlTestShouldNotSerializedChildrenElement >> shouldSerializedChildren [

	^ false
]

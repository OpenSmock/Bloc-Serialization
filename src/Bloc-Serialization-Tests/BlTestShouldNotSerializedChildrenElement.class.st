"
This BlELement is a used for testing the no serialization of children.
"
Class {
	#name : 'BlTestShouldNotSerializedChildrenElement',
	#superclass : 'BlElement',
	#category : 'Bloc-Serialization-Tests-Core',
	#package : 'Bloc-Serialization-Tests',
	#tag : 'Core'
}

{ #category : 'asserting' }
BlTestShouldNotSerializedChildrenElement >> shouldSerializedChildren [

	^ false
]

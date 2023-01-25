Class {
	#name : #BlocSerializationTests,
	#superclass : #TestCase,
	#category : #'Bloc-Serialization-Tests'
}

{ #category : #'as yet unclassified' }
BlocSerializationTests >> serializeThenMaterialize: aBlElement [

	^ aBlElement serialize materializeAsBlElement
]

{ #category : #'as yet unclassified' }
BlocSerializationTests >> test: aBlElement on: aBloc [

	| newObject |
	aBloc value: aBlElement.
	newObject := self serializeThenMaterialize: aBlElement.
	aBloc value: newObject
]

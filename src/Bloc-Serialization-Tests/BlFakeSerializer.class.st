Class {
	#name : #BlFakeSerializer,
	#superclass : #Object,
	#classInstVars : [
		'counter'
	],
	#category : #'Bloc-Serialization-Tests-Core'
}

{ #category : #initialization }
BlFakeSerializer class >> materialize: anObject [

	counter := counter + 1
]

{ #category : #initialization }
BlFakeSerializer class >> materializeCount [

	^ counter
]

{ #category : #initialization }
BlFakeSerializer class >> resetForTest [

	counter := 0.
]

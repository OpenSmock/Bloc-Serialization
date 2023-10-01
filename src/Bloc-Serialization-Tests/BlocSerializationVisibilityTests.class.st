Class {
	#name : 'BlocSerializationVisibilityTests',
	#superclass : 'BlocSerializationTests',
	#category : 'Bloc-Serialization-Tests-Core',
	#package : 'Bloc-Serialization-Tests',
	#tag : 'Core'
}

{ #category : 'tests' }
BlocSerializationVisibilityTests >> testGone [

	| origin |
	origin := BlElement new
		          background: Color red;
		          visibility: BlVisibility gone.

	self test: origin on: [ :element | 
		self assert: element visibility isVisible equals: false.
		self assert: element visibility isHidden equals: true.
		self assert: element visibility isGone equals: true ]
]

{ #category : 'tests' }
BlocSerializationVisibilityTests >> testHidden [

	| origin |
	origin := BlElement new
		          background: Color red;
		          visibility: BlVisibility hidden.

	self test: origin on: [ :element | 
		self assert: element visibility isVisible equals: false.
		self assert: element visibility isHidden equals: true.
		self assert: element visibility isGone equals: false ]
]

{ #category : 'tests' }
BlocSerializationVisibilityTests >> testVisible [

	| origin |
	origin := BlElement new background: (Color red); visibility: BlVisibility visible.

	self test: origin on: [ :element | 
		self assert: element visibility isVisible equals: true.
		self assert: element visibility isHidden equals: false.
		self assert: element visibility isGone equals: false ]
]

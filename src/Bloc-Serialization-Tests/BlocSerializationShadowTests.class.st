Class {
	#name : #BlocSerializationShadowTests,
	#superclass : #BlocSerializationTests,
	#category : #'Bloc-Serialization-Tests-Core'
}

{ #category : #tests }
BlocSerializationShadowTests >> testBlGaussianShadowEffect [

	| origin |
	origin := BlElement new
		          background: Color black;
		          effect:
			          (BlGaussianShadowEffect color: Color red width: 10 offset: 5 @ 5).

	self test: origin on: [ :element |
			self assert: (element effect isKindOf: BlGaussianShadowEffect).
			self assert: element effect width equals: 10.
			self assert: element effect color equals: Color red.
			self assert: element effect offset equals: 5 @ 5 ]
]

{ #category : #tests }
BlocSerializationShadowTests >> testBlSimpleShadowEffect [

	| origin |
	origin := BlElement new
		          background: Color black;
		          effect:
			          (BlSimpleShadowEffect color: Color red offset: 5 @ 5).

	self test: origin on: [ :element |
			self assert: (element effect isKindOf: BlSimpleShadowEffect).
			self assert: element effect color equals: Color red.
			self assert: element effect offset equals: 5 @ 5 ]
]

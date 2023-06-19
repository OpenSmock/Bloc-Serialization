Class {
	#name : #BlocSerializationBlRopedTextTests,
	#superclass : #BlocSerializationTests,
	#category : #'Bloc-Serialization-Tests-Core'
}

{ #category : #tests }
BlocSerializationBlRopedTextTests >> testMultiplesAttributes [

	| origin |
	origin := 'test' asRopedText asElement.
	origin text attributes: {
			(BlFontSizeAttribute size: 120).
			(BlTextForegroundAttribute new paint: Color red) }.

	self test: origin on: [ :element |
		| atributeFinder |
		atributeFinder := origin text attributesFinder.
		self assert: origin text rope asString equals: 'test'.
		self assert: (atributeFinder hasAttributeSuchThat: [ :att |
				 att class = BlFontSizeAttribute and: [ att size = 120 ] ]).
		self assert: (atributeFinder hasAttributeSuchThat: [ :att |
				 att class = BlTextForegroundAttribute and: [ att paint = Color red ] ]) ]
]

{ #category : #tests }
BlocSerializationBlRopedTextTests >> testNoAttributes [

	| origin |
	origin := 'test' asRopedText asElement.

	self
		test: origin
		on: [ :element | self assert: origin text rope asString equals: 'test' ]
]

{ #category : #tests }
BlocSerializationBlRopedTextTests >> testOneAttribute [

	| origin |
	origin := 'test' asRopedText asElement.
	origin text attributes: { BlFontSizeAttribute size: 120 }.

	self
		test: origin
		on: [ :element | | atributeFinder |
			atributeFinder := origin text attributesFinder.
		self assert: origin text rope asString equals: 'test'.
		self assert: (atributeFinder hasAttributeSuchThat: [ :att | att class = BlFontSizeAttribute and: [ att size = 120 ] ] ) ]
]

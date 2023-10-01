Class {
	#name : 'BlocSerializationBackgroundTests',
	#superclass : 'BlocSerializationTests',
	#category : 'Bloc-Serialization-Tests-Core',
	#package : 'Bloc-Serialization-Tests',
	#tag : 'Core'
}

{ #category : 'tests' }
BlocSerializationBackgroundTests >> testColor [

	| origin |
	origin := BlElement new background: (Color red alpha: 0.8).

	self test: origin on: [ :element |
		self assert: element background isTransparent equals: false.
		self
			assert: element background paint color
			equals: (Color red alpha: 0.8) ]
]

{ #category : 'tests' }
BlocSerializationBackgroundTests >> testImageBackground1 [

	| origin |
	origin := BlElement new background:
		          (BlImageBackground image:
			           PolymorphSystemSettings pharoLogoForm).

	self test: origin on: [ :element |
		self assert: element background isTransparent equals: false.
		self
			assert: element background image bits
			equals: PolymorphSystemSettings pharoLogoForm bits ]
]

{ #category : 'tests' }
BlocSerializationBackgroundTests >> testImageBackground2 [

	| origin |
	origin := BlElement new background:
		          ((BlImageBackground image:
			            PolymorphSystemSettings pharoLogoForm) opacity: 0.5).

	self test: origin on: [ :element |
		self assert: element background isTransparent equals: false.
		self
			assert: element background image bits
			equals: PolymorphSystemSettings pharoLogoForm bits.
		self assert: element background opacity equals: 0.5 ]
]

{ #category : 'tests' }
BlocSerializationBackgroundTests >> testLinearGradient1 [

	| origin |
	origin := BlElement new background:
		          (BlLinearGradientPaint vertical
			           from: Color red
			           to: Color blue).
	self test: origin on: [ :element | 
		self assert: element background isTransparent equals: false.
		self assert: element background paint start equals: 0 @ 0.
		self assert: element background paint end equals: 0 @ 1.
		self assert: element background paint stops size equals: 2.
		self
			assert: (element background paint stops at: 1)
			equals: 0 -> Color red.
		self
			assert: (element background paint stops at: 2)
			equals: 1 -> Color blue ]
]

{ #category : 'tests' }
BlocSerializationBackgroundTests >> testLinearGradient2 [

	| origin |
	origin := BlElement new background:
		          (BlLinearGradientPaint horizontal
			           from: Color red
			           to: Color blue).
	self test: origin on: [ :element | 
		self assert: element background isTransparent equals: false.
		self assert: element background paint start equals: 0 @ 0.
		self assert: element background paint end equals: 1 @ 0.
		self assert: element background paint stops size equals: 2.
		self
			assert: (element background paint stops at: 1)
			equals: 0 -> Color red.
		self
			assert: (element background paint stops at: 2)
			equals: 1 -> Color blue ]
]

{ #category : 'tests' }
BlocSerializationBackgroundTests >> testLinearGradient3 [

	| origin |
	origin := BlElement new background:
		          ((BlLinearGradientPaint direction: 1 @ 1)
			           from: Color red
			           to: Color blue).

	self test: origin on: [ :element | 
		self assert: element background isTransparent equals: false.
		self assert: element background paint start equals: 0 @ 0.
		self assert: element background paint end equals: 1 @ 1.
		self assert: element background paint stops size equals: 2.
		self
			assert: (element background paint stops at: 1)
			equals: 0 -> Color red.
		self
			assert: (element background paint stops at: 2)
			equals: 1 -> Color blue ]
]

{ #category : 'tests' }
BlocSerializationBackgroundTests >> testLinearGradient4 [

	| origin |
	origin := BlElement new background:
		          (BlLinearGradientPaint vertical stops: { 
				           (0 -> Color red).
				           (0.1 -> Color blue).
				           (0.2 -> Color green).
				           (0.3 -> Color yellow).
				           (1 -> Color black) }).
	self test: origin on: [ :element | 
		self assert: element background isTransparent equals: false.
		self assert: element background paint start equals: 0 @ 0.
		self assert: element background paint end equals: 0 @ 1.
		self assert: element background paint stops size equals: 5.
		self
			assert: (element background paint stops at: 1)
			equals: 0 -> Color red.
		self
			assert: (element background paint stops at: 2)
			equals: 0.1 -> Color blue.
		self
			assert: (element background paint stops at: 3)
			equals: 0.2 -> Color green.
		self
			assert: (element background paint stops at: 4)
			equals: 0.3 -> Color yellow.
		self
			assert: (element background paint stops at: 5)
			equals: 1 -> Color black ]
]

{ #category : 'tests' }
BlocSerializationBackgroundTests >> testPaintTransparent [

	| origin |
	origin := BlElement new background: BlPaint transparent.

	self flag: #ERROR. "By default the background is transparent so this test test nothing."

	self test: origin on: [ :element | 
		self assert: element background isTransparent equals: true ]
]

{ #category : 'tests' }
BlocSerializationBackgroundTests >> testRadailGradient1 [

	| origin |
	origin := BlElement new background: (BlRadialGradientPaint new
			           from: Color red to: Color blue;
			           center: 1 @ 5;
			           radius: 10;
			           yourself).

	self test: origin on: [ :element |
		self assert: element background isTransparent equals: false.
		self assert: element background paint center equals: 1 @ 5.
		self assert: element background paint radius equals: 10.
		self assert: element background paint stops size equals: 2.
		self
			assert: (element background paint stops at: 1)
			equals: 0 -> Color red.
		self
			assert: (element background paint stops at: 2)
			equals: 1 -> Color blue ]
]

{ #category : 'tests' }
BlocSerializationBackgroundTests >> testRadialGradient2 [

	| origin |
	origin := BlElement new background: (BlRadialGradientPaint new
			           stops: { 
					           (0 -> Color red).
					           (0.1 -> Color blue).
					           (0.2 -> Color green).
					           (0.3 -> Color yellow).
					           (1 -> Color black) };
			           center: 1 @ 5;
			           radius: 10;
			           yourself).

	self test: origin on: [ :element |
		self assert: element background isTransparent equals: false.
		self assert: element background paint center equals: 1 @ 5.
		self assert: element background paint radius equals: 10.
		self assert: element background paint stops size equals: 5.
		self
			assert: (element background paint stops at: 1)
			equals: 0 -> Color red.
		self
			assert: (element background paint stops at: 2)
			equals: 0.1 -> Color blue.
		self
			assert: (element background paint stops at: 3)
			equals: 0.2 -> Color green.
		self
			assert: (element background paint stops at: 4)
			equals: 0.3 -> Color yellow.
		self
			assert: (element background paint stops at: 5)
			equals: 1 -> Color black ]
]

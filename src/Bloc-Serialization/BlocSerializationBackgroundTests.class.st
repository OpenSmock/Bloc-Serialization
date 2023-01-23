Class {
	#name : #BlocSerializationBackgroundTests,
	#superclass : #TestCase,
	#category : #'Bloc-Serialization'
}

{ #category : #tests }
BlocSerializationBackgroundTests >> testColor [

	| origin unserialized |
	origin := BlElement new background: (Color red alpha: 0.8).
	self
		assert: origin background paint color
		equals: (Color red alpha: 0.8).

	unserialized := STON fromString: (STON toString: origin).
	self
		assert: unserialized background paint color
		equals: (Color red alpha: 0.8)
]

{ #category : #tests }
BlocSerializationBackgroundTests >> testImageBackground1 [

	| origin unserialized |
	origin := BlElement new background:
		          (BlImageBackground image:
			           PolymorphSystemSettings pharoLogoForm).
	self
		assert: origin background image bits
		equals: PolymorphSystemSettings pharoLogoForm bits.

	unserialized := STON fromString: (STON toString: origin).
	self
		assert: unserialized background image bits
		equals: PolymorphSystemSettings pharoLogoForm bits
]

{ #category : #tests }
BlocSerializationBackgroundTests >> testImageBackground2 [

	| origin unserialized |
	origin := BlElement new background:
		          ((BlImageBackground image:
			            PolymorphSystemSettings pharoLogoForm) opacity: 0.5).
	self
		assert: origin background image bits
		equals: PolymorphSystemSettings pharoLogoForm bits.
	self assert: origin background opacity equals: 0.5.

	unserialized := STON fromString: (STON toString: origin).
	self
		assert: unserialized background image bits
		equals: PolymorphSystemSettings pharoLogoForm bits.
	self assert: unserialized background opacity equals: 0.5
]

{ #category : #tests }
BlocSerializationBackgroundTests >> testLinearGradient1 [

	| origin unserialized |
	origin := BlElement new background:
		          (BlLinearGradientPaint vertical
			           from: Color red
			           to: Color blue).
	self assert: origin background paint start equals: 0 @ 0.
	self assert: origin background paint end equals: 0 @ 1.
	self assert: origin background paint stops size equals: 2.
	self
		assert: (origin background paint stops at: 1)
		equals: 0 -> Color red.
	self
		assert: (origin background paint stops at: 2)
		equals: 1 -> Color blue.

	unserialized := STON fromString: (STON toString: origin).
	self assert: unserialized background paint start equals: 0 @ 0.
	self assert: unserialized background paint end equals: 0 @ 1.
	self assert: unserialized background paint stops size equals: 2.
	self
		assert: (unserialized background paint stops at: 1)
		equals: 0 -> Color red.
	self
		assert: (unserialized background paint stops at: 2)
		equals: 1 -> Color blue
]

{ #category : #tests }
BlocSerializationBackgroundTests >> testLinearGradient2 [

	| origin unserialized |
	origin := BlElement new background:
		          (BlLinearGradientPaint horizontal
			           from: Color red
			           to: Color blue).
	self assert: origin background paint start equals: 0 @ 0.
	self assert: origin background paint end equals: 1 @ 0.
	self assert: origin background paint stops size equals: 2.
	self
		assert: (origin background paint stops at: 1)
		equals: 0 -> Color red.
	self
		assert: (origin background paint stops at: 2)
		equals: 1 -> Color blue.

	unserialized := STON fromString: (STON toString: origin).
	self assert: unserialized background paint start equals: 0 @ 0.
	self assert: unserialized background paint end equals: 1 @ 0.
	self assert: unserialized background paint stops size equals: 2.
	self
		assert: (unserialized background paint stops at: 1)
		equals: 0 -> Color red.
	self
		assert: (unserialized background paint stops at: 2)
		equals: 1 -> Color blue
]

{ #category : #tests }
BlocSerializationBackgroundTests >> testLinearGradient3 [

	| origin unserialized |
	origin := BlElement new background:
		          ((BlLinearGradientPaint direction: 1 @ 1)
			           from: Color red
			           to: Color blue).
	self assert: origin background paint start equals: 0 @ 0.
	self assert: origin background paint end equals: 1 @ 1.
	self assert: origin background paint stops size equals: 2.
	self
		assert: (origin background paint stops at: 1)
		equals: 0 -> Color red.
	self
		assert: (origin background paint stops at: 2)
		equals: 1 -> Color blue.

	unserialized := STON fromString: (STON toString: origin).
	self assert: unserialized background paint start equals: 0 @ 0.
	self assert: unserialized background paint end equals: 1 @ 1.
	self assert: unserialized background paint stops size equals: 2.
	self
		assert: (unserialized background paint stops at: 1)
		equals: 0 -> Color red.
	self
		assert: (unserialized background paint stops at: 2)
		equals: 1 -> Color blue
]

{ #category : #tests }
BlocSerializationBackgroundTests >> testLinearGradient4 [

	| origin unserialized |
	origin := BlElement new background:
		          (BlLinearGradientPaint vertical stops: { 
				           (0 -> Color red).
				           (0.1 -> Color blue).
				           (0.2 -> Color green).
				           (0.3 -> Color yellow).
				           (1 -> Color black) }).
	self assert: origin background paint start equals: 0 @ 0.
	self assert: origin background paint end equals: 0 @ 1.
	self assert: origin background paint stops size equals: 5.
	self
		assert: (origin background paint stops at: 1)
		equals: 0 -> Color red.
	self
		assert: (origin background paint stops at: 2)
		equals: 0.1 -> Color blue.
	self
		assert: (origin background paint stops at: 3)
		equals: 0.2 -> Color green.
	self
		assert: (origin background paint stops at: 4)
		equals: 0.3 -> Color yellow.
	self
		assert: (origin background paint stops at: 5)
		equals: 1 -> Color black.

	unserialized := STON fromString: (STON toString: origin).
	self assert: unserialized background paint start equals: 0 @ 0.
	self assert: unserialized background paint end equals: 0 @ 1.
	self assert: unserialized background paint stops size equals: 5.
	self
		assert: (unserialized background paint stops at: 1)
		equals: 0 -> Color red.
	self
		assert: (unserialized background paint stops at: 2)
		equals: 0.1 -> Color blue.
	self
		assert: (unserialized background paint stops at: 3)
		equals: 0.2 -> Color green.
	self
		assert: (unserialized background paint stops at: 4)
		equals: 0.3 -> Color yellow.
	self
		assert: (unserialized background paint stops at: 5)
		equals: 1 -> Color black
]

{ #category : #tests }
BlocSerializationBackgroundTests >> testPaintTransparent [

	| origin unserialized |
	origin := BlElement new background: BlPaint transparent.
	self assert: origin background paint isTransparent.

	unserialized := STON fromString: (STON toString: origin).
	self assert: unserialized background paint isTransparent
]

{ #category : #tests }
BlocSerializationBackgroundTests >> testRadailGradient1 [

	| origin unserialized |
	origin := BlElement new background: (BlRadialGradientPaint new
			           from: Color red to: Color blue;
			           center: 1 @ 5;
			           radius: 10;
			           yourself).
	self assert: origin background paint center equals: 1 @ 5.
	self assert: origin background paint radius equals: 10.
	self assert: origin background paint stops size equals: 2.
	self
		assert: (origin background paint stops at: 1)
		equals: 0 -> Color red.
	self
		assert: (origin background paint stops at: 2)
		equals: 1 -> Color blue.

	unserialized := STON fromString: (STON toString: origin).
	self assert: unserialized background paint center equals: 1 @ 5.
	self assert: unserialized background paint radius equals: 10.
	self assert: unserialized background paint stops size equals: 2.
	self
		assert: (unserialized background paint stops at: 1)
		equals: 0 -> Color red.
	self
		assert: (unserialized background paint stops at: 2)
		equals: 1 -> Color blue
]

{ #category : #tests }
BlocSerializationBackgroundTests >> testRadialGradient2 [

	| origin unserialized |
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
	self assert: origin background paint center equals: 1 @ 5.
	self assert: origin background paint radius equals: 10.
	self assert: origin background paint stops size equals: 5.
	self
		assert: (origin background paint stops at: 1)
		equals: 0 -> Color red.
	self
		assert: (origin background paint stops at: 2)
		equals: 0.1 -> Color blue.
	self
		assert: (origin background paint stops at: 3)
		equals: 0.2 -> Color green.
	self
		assert: (origin background paint stops at: 4)
		equals: 0.3 -> Color yellow.
	self
		assert: (origin background paint stops at: 5)
		equals: 1 -> Color black.

	unserialized := STON fromString: (STON toString: origin).
	self assert: unserialized background paint center equals: 1 @ 5.
	self assert: unserialized background paint radius equals: 10.
	self assert: unserialized background paint stops size equals: 5.
	self
		assert: (unserialized background paint stops at: 1)
		equals: 0 -> Color red.
	self
		assert: (unserialized background paint stops at: 2)
		equals: 0.1 -> Color blue.
	self
		assert: (unserialized background paint stops at: 3)
		equals: 0.2 -> Color green.
	self
		assert: (unserialized background paint stops at: 4)
		equals: 0.3 -> Color yellow.
	self
		assert: (unserialized background paint stops at: 5)
		equals: 1 -> Color black
]

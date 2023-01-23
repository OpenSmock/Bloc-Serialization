Class {
	#name : #BlocSerializationBorderTests,
	#superclass : #TestCase,
	#category : #'Bloc-Serialization'
}

{ #category : #tests }
BlocSerializationBorderTests >> testBorder [

	| builder origin unserialized |
	builder := BlBorderBuilder new.
	builder
		width: 10;
		paint: (Color red alpha: 0.8);
		opacity: 0.2.
	origin := BlElement new border: builder build.
	self assert: origin border width equals: 10.
	self assert: origin border opacity equals: 0.2.
	self assert: origin border paint color equals: (Color red alpha: 0.8).

	unserialized := STON fromString: (STON toString: origin).
	self assert: unserialized border width equals: 10.
	self assert: unserialized border opacity equals: 0.2.
	self assert: unserialized border paint color equals: (Color red alpha: 0.8)
]

{ #category : #tests }
BlocSerializationBorderTests >> testBorderCapButt [

	| builder origin unserialized |
	builder := BlBorderBuilder new.
	builder
		width: 10;
		paint: (Color red alpha: 0.8);
		opacity: 0.2;
		capButt.
	origin := BlElement new border: builder build.
	self assert: origin border width equals: 10.
	self assert: origin border opacity equals: 0.2.
	self assert: origin border paint color equals: (Color red alpha: 0.8).
	self
		assert: origin border style lineCap class
		equals: BlStrokeLineButtCap.

	unserialized := STON fromString: (STON toString: origin).
	self assert: unserialized border width equals: 10.
	self assert: unserialized border opacity equals: 0.2.
	self assert: unserialized border paint color equals: (Color red alpha: 0.8).
	self
		assert: unserialized border style lineCap class
		equals: BlStrokeLineButtCap
]

{ #category : #tests }
BlocSerializationBorderTests >> testBorderCapRound [

	| builder origin unserialized |
	builder := BlBorderBuilder new.
	builder
		width: 10;
		paint: (Color red alpha: 0.8);
		opacity: 0.2;
		capRound.
	origin := BlElement new border: builder build.
	self assert: origin border width equals: 10.
	self assert: origin border opacity equals: 0.2.
	self assert: origin border paint color equals: (Color red alpha: 0.8).
	self
		assert: origin border style lineCap class
		equals: BlStrokeLineRoundCap.

	unserialized := STON fromString: (STON toString: origin).
	self assert: unserialized border width equals: 10.
	self assert: unserialized border opacity equals: 0.2.
	self assert: unserialized border paint color equals: (Color red alpha: 0.8).
	self
		assert: unserialized border style lineCap class
		equals: BlStrokeLineRoundCap
]

{ #category : #tests }
BlocSerializationBorderTests >> testBorderCapSquare [

	| builder origin unserialized |
	builder := BlBorderBuilder new.
	builder
		width: 10;
		paint: (Color red alpha: 0.8);
		opacity: 0.2;
		capSquare.
	origin := BlElement new border: builder build.
	self assert: origin border width equals: 10.
	self assert: origin border opacity equals: 0.2.
	self assert: origin border paint color equals: (Color red alpha: 0.8).
	self
		assert: origin border style lineCap class
		equals: BlStrokeLineSquareCap.

	unserialized := STON fromString: (STON toString: origin).
	self assert: unserialized border width equals: 10.
	self assert: unserialized border opacity equals: 0.2.
	self assert: unserialized border paint color equals: (Color red alpha: 0.8).
	self
		assert: unserialized border style lineCap class
		equals: BlStrokeLineSquareCap
]

{ #category : #tests }
BlocSerializationBorderTests >> testBorderCustomDashArray [

	| builder origin unserialized |
	builder := BlBorderBuilder new.
	builder
		width: 10;
		paint: (Color red alpha: 0.8);
		opacity: 0.2;
		dashArray: #( 2.6 4.2 ).
	origin := BlElement new border: builder build.
	self assert: origin border width equals: 10.
	self assert: origin border opacity equals: 0.2.
	self assert: origin border paint color equals: (Color red alpha: 0.8).
	self assert: origin border style dashArray equals: #( 2.6 4.2 ).

	unserialized := STON fromString: (STON toString: origin).
	self assert: unserialized border width equals: 10.
	self assert: unserialized border opacity equals: 0.2.
	self assert: unserialized border paint color equals: (Color red alpha: 0.8).
	self assert: unserialized border style dashArray equals: #( 2.6 4.2 )
]

{ #category : #tests }
BlocSerializationBorderTests >> testBorderCustomDashOffset [

	| builder origin unserialized |
	builder := BlBorderBuilder new.
	builder
		width: 10;
		paint: (Color red alpha: 0.8);
		opacity: 0.2;
		dashArray: #( 2.6 4.2 );
		dashOffset: 3.5.
	origin := BlElement new border: builder build.
	self assert: origin border width equals: 10.
	self assert: origin border opacity equals: 0.2.
	self assert: origin border paint color equals: (Color red alpha: 0.8).
	self assert: origin border style dashArray equals: #( 2.6 4.2 ).
	self assert: origin border style dashOffset equals: 3.5.

	unserialized := STON fromString: (STON toString: origin).
	self assert: unserialized border width equals: 10.
	self assert: unserialized border opacity equals: 0.2.
	self assert: unserialized border paint color equals: (Color red alpha: 0.8).
	self assert: unserialized border style dashArray equals: #( 2.6 4.2 ).
	self assert: unserialized border style dashOffset equals: 3.5
]

{ #category : #tests }
BlocSerializationBorderTests >> testBorderDashed [

	| builder origin unserialized |
	builder := BlBorderBuilder new.
	builder
		width: 10;
		paint: (Color red alpha: 0.8);
		opacity: 0.2;
		dashed.
	origin := BlElement new border: builder build.
	self assert: origin border width equals: 10.
	self assert: origin border opacity equals: 0.2.
	self assert: origin border paint color equals: (Color red alpha: 0.8).
	self assert: origin border style dashArray equals: #( 6 4.2 ).
	self assert: origin border style dashOffset equals: 0.

	unserialized := STON fromString: (STON toString: origin).
	self assert: unserialized border width equals: 10.
	self assert: unserialized border opacity equals: 0.2.
	self
		assert: unserialized border paint color
		equals: (Color red alpha: 0.8).
	self assert: unserialized border style dashArray equals: #( 6 4.2 ).
	self assert: unserialized border style dashOffset equals: 0.
]

{ #category : #tests }
BlocSerializationBorderTests >> testBorderDashedSmall [

	| builder origin unserialized |
	builder := BlBorderBuilder new.
	builder
		width: 10;
		paint: (Color red alpha: 0.8);
		opacity: 0.2;
		dashedSmall.
	origin := BlElement new border: builder build.
	self assert: origin border width equals: 10.
	self assert: origin border opacity equals: 0.2.
	self assert: origin border paint color equals: (Color red alpha: 0.8).
	self assert: origin border style dashArray equals: #( 3 2 ).
	self assert: origin border style dashOffset equals: 0.

	unserialized := STON fromString: (STON toString: origin).
	self assert: unserialized border width equals: 10.
	self assert: unserialized border opacity equals: 0.2.
	self
		assert: unserialized border paint color
		equals: (Color red alpha: 0.8).
	self assert: unserialized border style dashArray equals: #( 3 2 ).
	self assert: unserialized border style dashOffset equals: 0
]

{ #category : #tests }
BlocSerializationBorderTests >> testBorderJoinBevel [

	| builder origin unserialized |
	builder := BlBorderBuilder new.
	builder
		width: 10;
		paint: (Color red alpha: 0.8);
		opacity: 0.2;
		joinBevel.
	origin := BlElement new border: builder build.
	self assert: origin border width equals: 10.
	self assert: origin border opacity equals: 0.2.
	self assert: origin border paint color equals: (Color red alpha: 0.8).
	self assert: origin border style lineJoin class equals: BlStrokeLineBevelJoin.

	unserialized := STON fromString: (STON toString: origin).
	self assert: unserialized border width equals: 10.
	self assert: unserialized border opacity equals: 0.2.
	self
		assert: unserialized border paint color
		equals: (Color red alpha: 0.8).
	self assert: unserialized border style dashArray equals: #( 3 2 ).
	self assert: unserialized border style lineJoin class equals: BlStrokeLineBevelJoin.
]

{ #category : #tests }
BlocSerializationBorderTests >> testBorderJoinMiter [

	| builder origin unserialized |
	builder := BlBorderBuilder new.
	builder
		width: 10;
		paint: (Color red alpha: 0.8);
		opacity: 0.2;
		joinMiter.
	origin := BlElement new border: builder build.
	self assert: origin border width equals: 10.
	self assert: origin border opacity equals: 0.2.
	self assert: origin border paint color equals: (Color red alpha: 0.8).
	self
		assert: origin border style lineJoin class
		equals: BlStrokeLineMiterJoin.

	unserialized := STON fromString: (STON toString: origin).
	self assert: unserialized border width equals: 10.
	self assert: unserialized border opacity equals: 0.2.
	self
		assert: unserialized border paint color
		equals: (Color red alpha: 0.8).
	self assert: unserialized border style dashArray equals: #( 3 2 ).
	self
		assert: unserialized border style lineJoin class
		equals: BlStrokeLineMiterJoin
]

{ #category : #tests }
BlocSerializationBorderTests >> testBorderJoinRound [

	| builder origin unserialized |
	builder := BlBorderBuilder new.
	builder
		width: 10;
		paint: (Color red alpha: 0.8);
		opacity: 0.2;
		joinRound.
	origin := BlElement new border: builder build.
	self assert: origin border width equals: 10.
	self assert: origin border opacity equals: 0.2.
	self assert: origin border paint color equals: (Color red alpha: 0.8).
	self
		assert: origin border style lineJoin class
		equals: BlStrokeLineRoundJoin.

	unserialized := STON fromString: (STON toString: origin).
	self assert: unserialized border width equals: 10.
	self assert: unserialized border opacity equals: 0.2.
	self
		assert: unserialized border paint color
		equals: (Color red alpha: 0.8).
	self assert: unserialized border style dashArray equals: #( 3 2 ).
	self
		assert: unserialized border style lineJoin class
		equals: BlStrokeLineRoundJoin
]

{ #category : #tests }
BlocSerializationBorderTests >> testBorderSolid [

	| builder origin unserialized |
	builder := BlBorderBuilder new.
	builder
		width: 10;
		paint: (Color red alpha: 0.8);
		opacity: 0.2;
		solid.
	origin := BlElement new border: builder build.
	self assert: origin border width equals: 10.
	self assert: origin border opacity equals: 0.2.
	self assert: origin border paint color equals: (Color red alpha: 0.8).
	self assert: origin border style dashArray equals: #().
	self assert: origin border style dashOffset equals: 0.

	unserialized := STON fromString: (STON toString: origin).
	self assert: unserialized border width equals: 10.
	self assert: unserialized border opacity equals: 0.2.
	self
		assert: unserialized border paint color
		equals: (Color red alpha: 0.8).
	self assert: unserialized border style dashArray equals: #().
	self assert: unserialized border style dashOffset equals: 0
]

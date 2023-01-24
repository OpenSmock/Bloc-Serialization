Class {
	#name : #BlocSerializationBorderTests,
	#superclass : #BlocSerializationTests,
	#category : #'Bloc-Serialization-Tests'
}

{ #category : #tests }
BlocSerializationBorderTests >> testBorder [

	| builder origin |
	builder := BlBorderBuilder new.
	builder
		width: 10;
		paint: (Color red alpha: 0.8);
		opacity: 0.2.
	origin := BlElement new border: builder build.

	self test: origin on: [ :element | 
		self assert: element border width equals: 10.
		self assert: element border opacity equals: 0.2.
		self
			assert: element border paint color
			equals: (Color red alpha: 0.8) ]
]

{ #category : #tests }
BlocSerializationBorderTests >> testBorderCapButt [

	| builder origin |
	builder := BlBorderBuilder new.
	builder
		width: 10;
		paint: (Color red alpha: 0.8);
		opacity: 0.2;
		capButt.
	origin := BlElement new border: builder build.

	self test: origin on: [ :element | 
		self assert: element border width equals: 10.
		self assert: element border opacity equals: 0.2.
		self
			assert: element border paint color
			equals: (Color red alpha: 0.8).
		self
			assert: element border style lineCap class
			equals: BlStrokeLineButtCap ]
]

{ #category : #tests }
BlocSerializationBorderTests >> testBorderCapRound [

	| builder origin |
	builder := BlBorderBuilder new.
	builder
		width: 10;
		paint: (Color red alpha: 0.8);
		opacity: 0.2;
		capRound.
	origin := BlElement new border: builder build.

	self test: origin on: [ :element | 
		self assert: element border width equals: 10.
		self assert: element border opacity equals: 0.2.
		self
			assert: element border paint color
			equals: (Color red alpha: 0.8).
		self
			assert: element border style lineCap class
			equals: BlStrokeLineRoundCap ]
]

{ #category : #tests }
BlocSerializationBorderTests >> testBorderCapSquare [

	| builder origin |
	builder := BlBorderBuilder new.
	builder
		width: 10;
		paint: (Color red alpha: 0.8);
		opacity: 0.2;
		capSquare.
	origin := BlElement new border: builder build.

	self test: origin on: [ :element | 
		self assert: element border width equals: 10.
		self assert: element border opacity equals: 0.2.
		self
			assert: element border paint color
			equals: (Color red alpha: 0.8).
		self
			assert: element border style lineCap class
			equals: BlStrokeLineSquareCap ]
]

{ #category : #tests }
BlocSerializationBorderTests >> testBorderCustomDashArray [

	| builder origin |
	builder := BlBorderBuilder new.
	builder
		width: 10;
		paint: (Color red alpha: 0.8);
		opacity: 0.2;
		dashArray: #( 2.6 4.2 ).
	origin := BlElement new border: builder build.

	self test: origin on: [ :element | 
		self assert: element border width equals: 10.
		self assert: element border opacity equals: 0.2.
		self
			assert: element border paint color
			equals: (Color red alpha: 0.8).
		self assert: element border style dashArray equals: #( 2.6 4.2 ) ]
]

{ #category : #tests }
BlocSerializationBorderTests >> testBorderCustomDashOffset [

	| builder origin |
	builder := BlBorderBuilder new.
	builder
		width: 10;
		paint: (Color red alpha: 0.8);
		opacity: 0.2;
		dashArray: #( 2.6 4.2 );
		dashOffset: 3.5.
	origin := BlElement new border: builder build.

	self test: origin on: [ :element | 
		self assert: element border width equals: 10.
		self assert: element border opacity equals: 0.2.
		self
			assert: element border paint color
			equals: (Color red alpha: 0.8).
		self assert: element border style dashArray equals: #( 2.6 4.2 ).
		self assert: element border style dashOffset equals: 3.5 ]
]

{ #category : #tests }
BlocSerializationBorderTests >> testBorderDashed [

	| builder origin |
	builder := BlBorderBuilder new.
	builder
		width: 10;
		paint: (Color red alpha: 0.8);
		opacity: 0.2;
		dashed.
	origin := BlElement new border: builder build.

	self test: origin on: [ :element | 
		self assert: element border width equals: 10.
		self assert: element border opacity equals: 0.2.
		self
			assert: element border paint color
			equals: (Color red alpha: 0.8).
		self assert: element border style dashArray equals: #( 6 4.2 ).
		self assert: element border style dashOffset equals: 0 ]
]

{ #category : #tests }
BlocSerializationBorderTests >> testBorderDashedSmall [

	| builder origin |
	builder := BlBorderBuilder new.
	builder
		width: 10;
		paint: (Color red alpha: 0.8);
		opacity: 0.2;
		dashedSmall.
	origin := BlElement new border: builder build.

	self test: origin on: [ :element | 
		self assert: element border width equals: 10.
		self assert: element border opacity equals: 0.2.
		self
			assert: element border paint color
			equals: (Color red alpha: 0.8).
		self assert: element border style dashArray equals: #( 3 2 ).
		self assert: element border style dashOffset equals: 0 ]
]

{ #category : #tests }
BlocSerializationBorderTests >> testBorderJoinBevel [

	| builder origin |
	builder := BlBorderBuilder new.
	builder
		width: 10;
		paint: (Color red alpha: 0.8);
		opacity: 0.2;
		joinBevel.
	origin := BlElement new border: builder build.

	self test: origin on: [ :element | 
		self assert: element border width equals: 10.
		self assert: element border opacity equals: 0.2.
		self
			assert: element border paint color
			equals: (Color red alpha: 0.8).
		self
			assert: element border style lineJoin class
			equals: BlStrokeLineBevelJoin ]
]

{ #category : #tests }
BlocSerializationBorderTests >> testBorderJoinMiter [

	| builder origin |
	builder := BlBorderBuilder new.
	builder
		width: 10;
		paint: (Color red alpha: 0.8);
		opacity: 0.2;
		joinMiter.
	origin := BlElement new border: builder build.

	self test: origin on: [ :element | 
		self assert: element border width equals: 10.
		self assert: element border opacity equals: 0.2.
		self
			assert: element border paint color
			equals: (Color red alpha: 0.8).
		self
			assert: element border style lineJoin class
			equals: BlStrokeLineMiterJoin ]
]

{ #category : #tests }
BlocSerializationBorderTests >> testBorderJoinRound [

	| builder origin |
	builder := BlBorderBuilder new.
	builder
		width: 10;
		paint: (Color red alpha: 0.8);
		opacity: 0.2;
		joinRound.
	origin := BlElement new border: builder build.


	self test: origin on: [ :element | 
		self assert: element border width equals: 10.
		self assert: element border opacity equals: 0.2.
		self
			assert: element border paint color
			equals: (Color red alpha: 0.8).
		self
			assert: element border style lineJoin class
			equals: BlStrokeLineRoundJoin ]
]

{ #category : #tests }
BlocSerializationBorderTests >> testBorderSolid [

	| builder origin |
	builder := BlBorderBuilder new.
	builder
		width: 10;
		paint: (Color red alpha: 0.8);
		opacity: 0.2;
		solid.
	origin := BlElement new border: builder build.

	self test: origin on: [ :element | 
		self assert: element border width equals: 10.
		self assert: element border opacity equals: 0.2.
		self
			assert: element border paint color
			equals: (Color red alpha: 0.8).
		self assert: element border style dashArray equals: #(  ).
		self assert: element border style dashOffset equals: 0 ]
]

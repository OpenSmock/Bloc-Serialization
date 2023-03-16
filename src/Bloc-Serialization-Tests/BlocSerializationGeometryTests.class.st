Class {
	#name : #BlocSerializationGeometryTests,
	#superclass : #BlocSerializationTests,
	#category : #'Bloc-Serialization-Tests-Core'
}

{ #category : #tests }
BlocSerializationGeometryTests >> testAnnulusSector [

	| origin |
	origin := BlElement new
		          geometry: (BlAnnulusSectorGeometry new
				           startAngle: 20;
				           endAngle: 180;
				           innerRadius: 0.1;
				           outerRadius: 0.9;
				           yourself);
		          yourself.

	self test: origin on: [ :element | 
		self assert: (element geometry isKindOf: BlAnnulusSectorGeometry).
		self assert: element geometry startAngle equals: 20.
		self assert: element geometry endAngle equals: 180.
		self assert: element geometry innerRadius equals: 0.1.
		self assert: element geometry outerRadius equals: 0.9 ]
]

{ #category : #tests }
BlocSerializationGeometryTests >> testBezierCurve [

	| origin |
	origin := BlElement new
		          geometry: (BlBezierCurveGeometry controlPoints: { 
						           (5 @ 0).
						           (20 @ 35).
						           (35 @ 40) });
		          yourself.

	self test: origin on: [ :element | 
		self assert: (element geometry isKindOf: BlBezierCurveGeometry).
		self assert: element geometry controlPoints equals: { 
						           (5 @ 0).
						           (20 @ 35).
						           (35 @ 40) }. ]
]

{ #category : #tests }
BlocSerializationGeometryTests >> testCircle [

	| origin |
	origin := BlElement new geometry: BlCircleGeometry new; yourself.

	self test: origin on: [ :element | 
		self assert: (element geometry isKindOf: BlCircleGeometry) ]
]

{ #category : #tests }
BlocSerializationGeometryTests >> testEllipse [

	| origin |
	origin := BlElement new
		          geometry: (BlEllipseGeometry new);
		          yourself.

	self test: origin on: [ :element | 
		self assert: (element geometry isKindOf: BlEllipseGeometry).
		]
]

{ #category : #tests }
BlocSerializationGeometryTests >> testEmpty [

	| origin |
	origin := BlElement new
		          geometry: BlEmptyGeometry new;
		          yourself.

	self test: origin on: [ :element | 
		self assert: (element geometry isKindOf: BlEmptyGeometry).
 ]
]

{ #category : #tests }
BlocSerializationGeometryTests >> testLine [

	| origin |
	origin := BlElement new
		          geometry: (BlLineGeometry from: 10 @ 10 to: 100 @ 10);
		          yourself.

	self test: origin on: [ :element | 
		self assert: (element geometry isKindOf: BlLineGeometry).
		self assert: element geometry from equals: 10 @ 10.
		self assert: element geometry to equals: 100 @ 10 ]
]

{ #category : #tests }
BlocSerializationGeometryTests >> testPolygon [

	| origin |
	origin := BlElement new
		          geometry: (BlPolygonGeometry vertices: { 
						           (36 @ 0).
						           (48 @ 0).
						           (48 @ 36).
						           (84 @ 36).
						           (84 @ 48).
						           (48 @ 48).
						           (48 @ 84).
						           (36 @ 84).
						           (36 @ 48).
						           (0 @ 48).
						           (0 @ 36).
						           (36 @ 36) });
		          yourself.

	self test: origin on: [ :element | 
		self assert: (element geometry isKindOf: BlPolygonGeometry).
		self assert: element geometry vertices equals:{ 
						           (36 @ 0).
						           (48 @ 0).
						           (48 @ 36).
						           (84 @ 36).
						           (84 @ 48).
						           (48 @ 48).
						           (48 @ 84).
						           (36 @ 84).
						           (36 @ 48).
						           (0 @ 48).
						           (0 @ 36).
						           (36 @ 36) }.
 ]
]

{ #category : #tests }
BlocSerializationGeometryTests >> testPolyline [

	| origin |
	origin := BlElement new
		          geometry: (BlPolylineGeometry vertices: { 
						           (36 @ 0).
						           (48 @ 0).
						           (48 @ 36) });
		          yourself.

	self test: origin on: [ :element | 
		self assert: (element geometry isKindOf: BlPolylineGeometry).
		self assert: element geometry vertices equals: { 
				(36 @ 0).
				(48 @ 0).
				(48 @ 36) } ]
]

{ #category : #tests }
BlocSerializationGeometryTests >> testRectangle [

	| origin |
	origin := BlElement new
		          geometry: BlRectangleGeometry new;
		          yourself.

	self test: origin on: [ :element | 
		self assert: (element geometry isKindOf: BlRectangleGeometry) ]
]

{ #category : #tests }
BlocSerializationGeometryTests >> testRoundedRectangle1 [

	| origin |
	origin := BlElement new
		          geometry: (BlRoundedRectangleGeometry cornerRadius: 5);
		          yourself.

	self test: origin on: [ :element | 
		self assert: (element geometry isKindOf: BlRoundedRectangleGeometry).
		self assert: element geometry cornerRadii topLeft equals: 5.
		self assert: element geometry cornerRadii topRight equals: 5.
		self assert: element geometry cornerRadii bottomRight equals: 5.
		self assert: element geometry cornerRadii bottomLeft equals: 5. ]
]

{ #category : #tests }
BlocSerializationGeometryTests >> testRoundedRectangle2 [

	| origin |
	origin := BlElement new
		          geometry:
			          (BlRoundedRectangleGeometry cornerRadii:
					           (BlCornerRadii new
						            topLeft: 1;
						            topRight: 2;
						            bottomRight: 3;
						            bottomLeft: 4;
						            yourself));
		          yourself.

	self test: origin on: [ :element | 
		self assert: (element geometry isKindOf: BlRoundedRectangleGeometry).
		self assert: element geometry cornerRadii topLeft equals: 1.
		self assert: element geometry cornerRadii topRight equals: 2.
		self assert: element geometry cornerRadii bottomRight equals: 3.
		self assert: element geometry cornerRadii bottomLeft equals: 4 ]
]

{ #category : #tests }
BlocSerializationGeometryTests >> testSquare [

	| origin |
	origin := BlElement new
		          geometry: BlSquareGeometry new;
		          yourself.

	self test: origin on: [ :element | 
		self assert: (element geometry isKindOf: BlSquareGeometry) ]
]

{ #category : #tests }
BlocSerializationGeometryTests >> testTriangle1 [

	| origin |
	origin := BlElement new
		          geometry: BlTriangleGeometry new beTop;
		          yourself.

	self test: origin on: [ :element | 
		self assert: (element geometry isKindOf: BlTriangleGeometry).
		self assert: (element geometry isTop) ]
]

{ #category : #tests }
BlocSerializationGeometryTests >> testTriangle2 [

	| origin |
	origin := BlElement new
		          geometry: BlTriangleGeometry new beBottom;
		          yourself.

	self test: origin on: [ :element | 
		self assert: (element geometry isKindOf: BlTriangleGeometry).
		self assert: element geometry isBottom ]
]

{ #category : #tests }
BlocSerializationGeometryTests >> testTriangle3 [

	| origin |
	origin := BlElement new
		          geometry: BlTriangleGeometry new beLeft;
		          yourself.

	self test: origin on: [ :element | 
		self assert: (element geometry isKindOf: BlTriangleGeometry).
		self assert: element geometry isLeft ]
]

{ #category : #tests }
BlocSerializationGeometryTests >> testTriangle4 [

	| origin |
	origin := BlElement new
		          geometry: BlTriangleGeometry new beRight;
		          yourself.

	self test: origin on: [ :element | 
		self assert: (element geometry isKindOf: BlTriangleGeometry).
		self assert: element geometry isRight ]
]

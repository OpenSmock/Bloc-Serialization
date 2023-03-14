Class {
	#name : #BlocSerializationLayoutSimpleTests,
	#superclass : #BlocSerializationTests,
	#category : #'Bloc-Serialization-Tests'
}

{ #category : #tests }
BlocSerializationLayoutSimpleTests >> parentWithChildExactSize [

	| child parent |
	child := BlElement new.
	child layout: BlBasicLayout uniqueInstance.
	"The default layout of an element is already such instance so
	the expression is not needed."
	child background: (Color red alpha: 0.3).
	child border: (BlBorder paint: Color red width: 1).
	child constraintsDo: [ :c | 
		c horizontal exact: 100.
		c vertical exact: 100 ].
	parent := BlElement new.
	parent layout: BlBasicLayout uniqueInstance.
	"The default layout of an element is already such instance so
	the expression is not needed."
	parent background: (Color gray alpha: 0.3).
	parent padding: (BlInsets all: 25).
	parent constraintsDo: [ :c | 
		c horizontal exact: 300.
		c vertical exact: 300 ].
	parent addChild: child.

	^ parent
]

{ #category : #tests }
BlocSerializationLayoutSimpleTests >> testForceLayoutOfMatchParent [

	| origin |
	origin := BlElement new.
	origin border: (BlBorder paint: Color gray width: 2).
	origin background: Color lightGray.
	origin constraintsDo: [ :c | 
		c horizontal matchParent.
		c vertical matchParent ].
	
	self
		test: origin
		on: [ :element | element forceLayout.self assert: element extent equals: 800 @ 600 ]
]

{ #category : #tests }
BlocSerializationLayoutSimpleTests >> testParentWithChildExactSize [

	| parent child |
	parent := self parentWithChildExactSize.
	child := parent children first.

	self test: parent on: [ :element | 
		element forceLayout.
		self assert: element extent equals: 300 @ 300 ].
	self test: child on: [ :element | 
		element forceLayout.
		child := parent children first.
		self assert: element extent equals: 100 @ 100 ]
]

{ #category : #tests }
BlocSerializationLayoutSimpleTests >> testParentWithChildFitContent [

	| child parent |
	parent := self parentWithChildExactSize.
	child := parent children first.
	child constraintsDo: [ :c | 
		c horizontal fitContent.
		c vertical fitContent ].

	self test: parent on: [ :element | 
		element forceLayout.
		self assert: element extent equals: 300 @ 300 ].
	self test: child on: [ :element | 
		element forceLayout.
		child := parent children first.
		self assert: element extent equals: 0 @ 0 ]
]

{ #category : #tests }
BlocSerializationLayoutSimpleTests >> testParentWithChildMatchParent [

	| child parent |
	parent := self parentWithChildExactSize.
	child := parent children first.
	child constraintsDo: [ :c | 
		c horizontal matchParent.
		c vertical matchParent ].

	self test: parent on: [ :element | 
		element forceLayout.
		self assert: element extent equals: 300 @ 300 ].
	self test: parent on: [ :element | 
		element forceLayout.
		child := parent children first.
		self assert: child extent equals: 300 @ 300 ]
]

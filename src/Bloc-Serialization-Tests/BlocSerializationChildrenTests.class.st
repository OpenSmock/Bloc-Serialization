Class {
	#name : #BlocSerializationChildrenTests,
	#superclass : #BlocSerializationTests,
	#category : #'Bloc-Serialization-Tests'
}

{ #category : #tests }
BlocSerializationChildrenTests >> testChildren [

	| origin e1 e2 e3 |
	origin := BlElement new.
	e1 := BlElement new.
	e2 := BlElement new.
	e3 := BlElement new.

	origin addChildren: { 
			e1.
			e2.
			e3 }.

	self test: origin on: [ :element | 
		self assert: element parent equals: nil.
		self assert: element children size equals: 3.
		self assert: (element childAt: 1) owner equals: element.
		self assert: (element childAt: 1) isFirstChild equals: true.
		self assert: (element childAt: 1) isLastChild equals: false.
		self assert: (element childAt: 2) owner equals: element.
		self assert: (element childAt: 2) isFirstChild equals: false.
		self assert: (element childAt: 2) isLastChild equals: false.
		self assert: (element childAt: 3) owner equals: element.
		self assert: (element childAt: 3) isFirstChild equals: false.
		self assert: (element childAt: 3) isLastChild equals: true ]
]

{ #category : #tests }
BlocSerializationChildrenTests >> testChildren1 [

	| origin e1 e2 e3 |
	origin := BlElement new size: 300 @ 500; background: Color red; yourself.
	e1 := BlElement new size: 200 @ 100; background: Color blue; yourself.
	e2 := BlElement new size: 50 @ 10; background: Color green; yourself.
	e3 := BlElement new size: 80 @ 600; background: Color yellow; yourself.

	origin addChildren: { 
			e1.
			e2.
			e3 }.

	self test: origin on: [ :element | 
		self assert: element parent equals: nil.
		self assert: element children size equals: 3.
		self assert: (element childAt: 1) owner equals: element.
		self assert: (element childAt: 1) isFirstChild equals: true.
		self assert: (element childAt: 1) isLastChild equals: false.
		self assert: (element childAt: 2) owner equals: element.
		self assert: (element childAt: 2) isFirstChild equals: false.
		self assert: (element childAt: 2) isLastChild equals: false.
		self assert: (element childAt: 3) owner equals: element.
		self assert: (element childAt: 3) isFirstChild equals: false.
		self assert: (element childAt: 3) isLastChild equals: true ]
]

{ #category : #tests }
BlocSerializationChildrenTests >> testChildren2 [

	| origin e1 e2 e3 |
	origin := BlElement new
		          size: 300 @ 500;
		          background: Color red;
		          yourself.
	e1 := BlElement new
		      size: 200 @ 100;
		      background: Color blue;
		      yourself.
	e2 := BlElement new
		      size: 50 @ 10;
		      background: Color green;
		      yourself.
	e3 := BlElement new
		      size: 80 @ 600;
		      background: Color yellow;
		      yourself.

	origin addChildren: { 
			e1.
			e2.
			e3 }.

	self test: origin on: [ :element |
		self assert: element constraints horizontal resizer size equals: 300.
		self assert: element constraints vertical resizer size equals: 500.
		self assert: (element childAt: 1) constraints horizontal resizer size equals: 200.
		self assert: (element childAt: 2) constraints horizontal resizer size equals: 50.
		self assert: (element childAt: 3) constraints horizontal resizer size equals: 80.
		self assert: (element childAt: 1) constraints vertical resizer size equals: 100.
		self assert: (element childAt: 2) constraints vertical resizer size equals: 10.
		self assert: (element childAt: 3) constraints vertical resizer size equals: 600. ]
]

{ #category : #tests }
BlocSerializationChildrenTests >> testChildren3 [

	| origin e1 e2 e3 |
	origin := BlElement new
		          size: 300 @ 500;
		          background: Color red;
		          yourself.
	e1 := BlElement new
		      size: 200 @ 100;
		      background: Color blue;
		      yourself.
	e2 := BlElement new
		      size: 50 @ 10;
		      background: Color green;
		      yourself.
	e3 := BlElement new
		      size: 80 @ 600;
		      background: Color yellow;
		      yourself.

	origin addChildren: { 
			e1.
			e2.
			e3 }.

	self test: origin on: [ :element | 
		self assert: element background paint color equals: Color red.
		self assert: (element childAt: 1) background paint color equals: Color blue.
		self assert: (element childAt: 2) background paint color equals: Color green.
		self assert: (element childAt: 3) background paint color equals: Color yellow ]
]

{ #category : #tests }
BlocSerializationChildrenTests >> testChildrenBasic1 [

	| origin e1 e2 e3 |
	origin := BlElement new.
	e1 := BlElement new.
	e2 := BlElement new.
	e3 := BlElement new.

	origin addChildren: { 
			e1.
			e2.
			e3 }.

	self test: origin on: [ :element | 
		self assert: element parent equals: nil.
		self assert: element children size equals: 3.
		self assert: (element childAt: 1) owner equals: element.
		self assert: (element childAt: 1) isFirstChild equals: true.
		self assert: (element childAt: 1) isLastChild equals: false.
		self assert: (element childAt: 2) owner equals: element.
		self assert: (element childAt: 2) isFirstChild equals: false.
		self assert: (element childAt: 2) isLastChild equals: false.
		self assert: (element childAt: 3) owner equals: element.
		self assert: (element childAt: 3) isFirstChild equals: false.
		self assert: (element childAt: 3) isLastChild equals: true ]
]

{ #category : #tests }
BlocSerializationChildrenTests >> testChildrenBasic2 [

	| origin e1 e2 e3 |
	origin := BlElement new.
	e1 := BlElement new.
	e2 := BlElement new.
	e3 := BlElement new.

	origin addChild: e1.
	e1 addChild: e2.
	e2 addChild: e3.

	self test: origin on: [ :element | 
		self assert: element parent equals: nil.
		self assert: element children size equals: 1.

		self assert: (element childAt: 1) owner equals: element.
		self assert: (element childAt: 1) children size equals: 1.

		self assert: ((element childAt: 1) childAt: 1) children size equals: 1.
		self
			assert: ((element childAt: 1) childAt: 1) owner
			equals: (element childAt: 1).
			
		self assert: (((element childAt: 1) childAt: 1) childAt: 1) children size equals: 0.
		self
			assert: (((element childAt: 1) childAt: 1) childAt: 1) owner
			equals: ((element childAt: 1) childAt: 1) ]
]

{ #category : #tests }
BlocSerializationChildrenTests >> testNoChildren [

	| origin |
	origin := BlElement new.

	self
		test: origin
		on: [ :element | self assert: element children size equals: 0.
			self assert: element parent equals: nil ]
]

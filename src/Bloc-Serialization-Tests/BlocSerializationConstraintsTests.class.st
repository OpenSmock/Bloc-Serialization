Class {
	#name : #BlocSerializationConstraintsTests,
	#superclass : #BlocSerializationTests,
	#category : #'Bloc-Serialization-Tests'
}

{ #category : #tests }
BlocSerializationConstraintsTests >> testHeight [

	| origin |
	origin := BlElement new
		          constraintsDo: [ :c | 
			          c minHeight: 100.
			          c maxHeight: 500 ];
		          yourself.
	self test: origin on: [ :element | 
		self assert: element constraints minHeight equals: 100.
		self assert: element constraints maxHeight equals: 500 ]
]

{ #category : #tests }
BlocSerializationConstraintsTests >> testMargin1 [

	| origin |
	origin := BlElement new
		          margin: (BlInsets all: 10);
		          yourself.

	self test: origin on: [ :element | 
		self assert: element margin top equals: 10.
		self assert: element margin bottom equals: 10.
		self assert: element margin left equals: 10.
		self assert: element margin right equals: 10 ]
]

{ #category : #tests }
BlocSerializationConstraintsTests >> testMargin2 [

	| origin |
	origin := BlElement new
		          margin: (BlInsets
				           top: 1
				           left: 2
				           bottom: 3
				           right: 4);
		          yourself.
	
		self test: origin on: [ :element | 
		self assert: element margin top equals: 1.
	self assert: element margin left equals: 2.
	self assert: element margin bottom equals: 3.
	self assert: element margin right equals: 4. ]
	
]

{ #category : #tests }
BlocSerializationConstraintsTests >> testMargin3 [

	| origin |
	origin := BlElement new
		          constraintsDo: [ :c | c margin: (BlInsets all: 10) ];
		          yourself.
	self test: origin on: [ :element | 
		self assert: element margin top equals: 10.
		self assert: element margin left equals: 10.
		self assert: element margin bottom equals: 10.
		self assert: element margin right equals: 10 ]
]

{ #category : #tests }
BlocSerializationConstraintsTests >> testMargin4 [

	| origin |
	origin := BlElement new
		          constraintsDo: [ :c | 
			          c margin: (BlInsets
						           top: 1
						           left: 2
						           bottom: 3
						           right: 4) ];
		          yourself.
	self test: origin on: [ :element | 
		self assert: element margin top equals: 1.
		self assert: element margin left equals: 2.
		self assert: element margin bottom equals: 3.
		self assert: element margin right equals: 4 ]
]

{ #category : #tests }
BlocSerializationConstraintsTests >> testPadding1 [

	| origin |
	origin := BlElement new
		          padding: (BlInsets all: 10);
		          yourself.

	self test: origin on: [ :element | 
		self assert: element padding top equals: 10.
		self assert: element padding bottom equals: 10.
		self assert: element padding left equals: 10.
		self assert: element padding right equals: 10 ]
]

{ #category : #tests }
BlocSerializationConstraintsTests >> testPadding2 [

	| origin |
	origin := BlElement new
		          padding: (BlInsets
				           top: 1
				           left: 2
				           bottom: 3
				           right: 4);
		          yourself.
	self test: origin on: [ :element | 
		self assert: element padding top equals: 1.
		self assert: element padding left equals: 2.
		self assert: element padding bottom equals: 3.
		self assert: element padding right equals: 4 ]
]

{ #category : #tests }
BlocSerializationConstraintsTests >> testPadding3 [

	| origin |
	origin := BlElement new
		          constraintsDo: [ :c | c padding: (BlInsets all: 10) ];
		          yourself.
	self test: origin on: [ :element | 
		self assert: element padding top equals: 10.
		self assert: element padding bottom equals: 10.
		self assert: element padding left equals: 10.
		self assert: element padding right equals: 10 ]
]

{ #category : #tests }
BlocSerializationConstraintsTests >> testPadding4 [

	| origin |
	origin := BlElement new
		          constraintsDo: [ :c | 
			          c padding: (BlInsets
						           top: 1
						           left: 2
						           bottom: 3
						           right: 4) ];
		          yourself.
	self test: origin on: [ :element | 
		self assert: element padding top equals: 1.
		self assert: element padding left equals: 2.
		self assert: element padding bottom equals: 3.
		self assert: element padding right equals: 4 ]
]

{ #category : #tests }
BlocSerializationConstraintsTests >> testPosition1 [

	| origin |
	origin := BlElement new
		          constraintsDo: [ :c | c position: 100 @ 500 ];
		          yourself.
	self test: origin on: [ :element | 
		self assert: element constraints position equals: 100 @ 500 ]
]

{ #category : #tests }
BlocSerializationConstraintsTests >> testPosition2 [

	| origin |
	origin := BlElement new
		          relocate: 100 @ 500;
		          yourself.
		
	self test: origin on: [ :element | 
		self assert: element constraints position equals: 100 @ 500. ]
	
]

{ #category : #tests }
BlocSerializationConstraintsTests >> testSize [

	| origin |
	origin := BlElement new size: 10 @ 20; yourself.
	self test: origin on: [ :element | 
		self assert: element constraints horizontal resizer size equals: 10.
		self assert: element constraints vertical resizer size equals: 20 ]
]

{ #category : #tests }
BlocSerializationConstraintsTests >> testWidth [

	| origin |
	origin := BlElement new
		          constraintsDo: [ :c | 
			          c minWidth: 100.
			          c maxWidth: 500 ];
		          yourself.
	self test: origin on: [ :element | 
		self assert: element constraints minWidth equals: 100.
		self assert: element constraints maxWidth equals: 500 ]
]

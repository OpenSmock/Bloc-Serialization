Class {
	#name : #BlocSerializationConstraintsTests,
	#superclass : #TestCase,
	#category : #'Bloc-Serialization'
}

{ #category : #tests }
BlocSerializationConstraintsTests >> testHeight [

	| origin unserialized |
	origin := BlElement new
		          constraintsDo: [ :c | 
			          c minHeight: 100.
			          c maxHeight: 500 ];
		          yourself.
	self assert: origin constraints minHeight equals: 100.
	self assert: origin constraints maxHeight equals: 500.

	unserialized := STON fromString: (STON toString: origin).
	self assert: unserialized constraints minHeight equals: 100.
	self assert: unserialized constraints maxHeight equals: 500
]

{ #category : #tests }
BlocSerializationConstraintsTests >> testMargin1 [

	| origin unserialized |
	origin := BlElement new
		          margin: (BlInsets all: 10);
		          yourself.
	self assert: origin margin top equals: 10.
	self assert: origin margin bottom equals: 10.
	self assert: origin margin left equals: 10.
	self assert: origin margin right equals: 10.

	unserialized := STON fromString: (STON toString: origin).
	self assert: unserialized margin top equals: 10.
	self assert: unserialized margin bottom equals: 10.
	self assert: unserialized margin left equals: 10.
	self assert: unserialized margin right equals: 10
]

{ #category : #tests }
BlocSerializationConstraintsTests >> testMargin2 [

	| origin unserialized |
	origin := BlElement new
		          margin: (BlInsets
				           top: 1
				           left: 2
				           bottom: 3
				           right: 4);
		          yourself.
	self assert: origin margin top equals: 1.
	self assert: origin margin left equals: 2.
	self assert: origin margin bottom equals: 3.
	self assert: origin margin right equals: 4.

	unserialized := STON fromString: (STON toString: origin).
	self assert: unserialized margin top equals: 1.
	self assert: unserialized margin left equals: 2.
	self assert: unserialized margin bottom equals: 3.
	self assert: unserialized margin right equals: 4
]

{ #category : #tests }
BlocSerializationConstraintsTests >> testMargin3 [

	| origin unserialized |
	origin := BlElement new
		          constraintsDo: [ :c | c margin: (BlInsets all: 10) ];
		          yourself.
	self assert: origin margin top equals: 10.
	self assert: origin margin bottom equals: 10.
	self assert: origin margin left equals: 10.
	self assert: origin margin right equals: 10.

	unserialized := STON fromString: (STON toString: origin).
	self assert: unserialized margin top equals: 10.
	self assert: unserialized margin bottom equals: 10.
	self assert: unserialized margin left equals: 10.
	self assert: unserialized margin right equals: 10
]

{ #category : #tests }
BlocSerializationConstraintsTests >> testMargin4 [

	| origin unserialized |
	origin := BlElement new
		          constraintsDo: [ :c | 
			          c margin: (BlInsets
						           top: 1
						           left: 2
						           bottom: 3
						           right: 4) ];
		          yourself.
	self assert: origin margin top equals: 1.
	self assert: origin margin left equals: 2.
	self assert: origin margin bottom equals: 3.
	self assert: origin margin right equals: 4.

	unserialized := STON fromString: (STON toString: origin).
	self assert: unserialized margin top equals: 1.
	self assert: unserialized margin left equals: 2.
	self assert: unserialized margin bottom equals: 3.
	self assert: unserialized margin right equals: 4
]

{ #category : #tests }
BlocSerializationConstraintsTests >> testPadding1 [

	| origin unserialized |
	origin := BlElement new padding: (BlInsets all: 10); yourself.
	self assert: origin padding top equals: 10.
	self assert: origin padding bottom equals: 10.
	self assert: origin padding left equals: 10.
	self assert: origin padding right equals: 10.

	unserialized := STON fromString: (STON toString: origin).
	self assert: unserialized padding top equals: 10.
	self assert: unserialized padding bottom equals: 10.
	self assert: unserialized padding left equals: 10.
	self assert: unserialized padding right equals: 10.
]

{ #category : #tests }
BlocSerializationConstraintsTests >> testPadding2 [

	| origin unserialized |
	origin := BlElement new
		          padding: (BlInsets top: 1 left: 2 bottom: 3 right: 4);
		          yourself.
	self assert: origin padding top equals: 1.
	self assert: origin padding left equals: 2.
	self assert: origin padding bottom equals: 3.
	self assert: origin padding right equals: 4.

	unserialized := STON fromString: (STON toString: origin).
	self assert: unserialized padding top equals: 1.
	self assert: unserialized padding left equals: 2.
	self assert: unserialized padding bottom equals: 3.
	self assert: unserialized padding right equals: 4.
]

{ #category : #tests }
BlocSerializationConstraintsTests >> testPadding3 [

	| origin unserialized |
	origin := BlElement new constraintsDo: [ :c | c padding: (BlInsets all: 10) ]
		          ;
		          yourself.
	self assert: origin padding top equals: 10.
	self assert: origin padding bottom equals: 10.
	self assert: origin padding left equals: 10.
	self assert: origin padding right equals: 10.

	unserialized := STON fromString: (STON toString: origin).
	self assert: unserialized padding top equals: 10.
	self assert: unserialized padding bottom equals: 10.
	self assert: unserialized padding left equals: 10.
	self assert: unserialized padding right equals: 10
]

{ #category : #tests }
BlocSerializationConstraintsTests >> testPadding4 [

	| origin unserialized |
	origin := BlElement new constraintsDo: [ :c | c padding: (BlInsets
				           top: 1
				           left: 2
				           bottom: 3
				           right: 4) ]
		          ;
		          yourself.
	self assert: origin padding top equals: 1.
	self assert: origin padding left equals: 2.
	self assert: origin padding bottom equals: 3.
	self assert: origin padding right equals: 4.

	unserialized := STON fromString: (STON toString: origin).
	self assert: unserialized padding top equals: 1.
	self assert: unserialized padding left equals: 2.
	self assert: unserialized padding bottom equals: 3.
	self assert: unserialized padding right equals: 4
]

{ #category : #tests }
BlocSerializationConstraintsTests >> testPosition1 [

	| origin unserialized |
	origin := BlElement new
		          constraintsDo: [ :c | c position: 100 @ 500 ];
		          yourself.
	self assert: origin constraints position equals: 100 @ 500.

	unserialized := STON fromString: (STON toString: origin).
	self assert: unserialized constraints position equals: 100 @ 500
]

{ #category : #tests }
BlocSerializationConstraintsTests >> testPosition2 [

	| origin unserialized |
	origin := BlElement new relocate: 100 @ 500; yourself.
	self assert: origin constraints position equals: 100 @ 500.

	unserialized := STON fromString: (STON toString: origin).
	self assert: unserialized constraints position equals: 100 @ 500
]

{ #category : #tests }
BlocSerializationConstraintsTests >> testWidth [

	| origin unserialized |
	origin := BlElement new
		          constraintsDo: [ :c | 
			          c minWidth: 100.
			          c maxWidth: 500 ];
		          yourself.
	self assert: origin constraints minWidth equals: 100.
	self assert: origin constraints maxWidth equals: 500.

	unserialized := STON fromString: (STON toString: origin).
	self assert: unserialized constraints minWidth equals: 100.
	self assert: unserialized constraints maxWidth equals: 500
]

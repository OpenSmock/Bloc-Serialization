Class {
	#name : #BlocSerializationMarginTests,
	#superclass : #TestCase,
	#category : #'Bloc-Serialization'
}

{ #category : #tests }
BlocSerializationMarginTests >> testMargin1 [

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
BlocSerializationMarginTests >> testMargin2 [

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
BlocSerializationMarginTests >> testMargin3 [

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
BlocSerializationMarginTests >> testPadding4 [

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

Class {
	#name : #BlocSerializationPaddingTests,
	#superclass : #TestCase,
	#category : #'Bloc-Serialization'
}

{ #category : #tests }
BlocSerializationPaddingTests >> testPadding1 [

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
BlocSerializationPaddingTests >> testPadding2 [

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
BlocSerializationPaddingTests >> testPadding3 [

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
BlocSerializationPaddingTests >> testPadding4 [

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

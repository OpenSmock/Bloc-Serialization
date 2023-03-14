Extension { #name : #BlDirectEventDispatcher }

{ #category : #'*Bloc-Serialization-STON' }
BlDirectEventDispatcher class >> fromSton: stonReader [

	"Create a new instance and delegate decoding to instance side.
	Override only when new instance should be created directly (see implementors). "

	^ self basicNew initialize;
		  fromSton: stonReader;
		  yourself
]

{ #category : #'*Bloc-Serialization-STON' }
BlDirectEventDispatcher >> fromSton: stonReader [

	stonReader parseMapDo: [ :key :value | 
		key = #handlers ifTrue: [ 
			value do: [ :each | self addEventHandler: each ] ].
		key = #owner ifTrue: [ self owner: value ] ]
]

{ #category : #'*Bloc-Serialization-STON' }
BlDirectEventDispatcher >> stonOn: stonWriter [

	stonWriter writeObject: self streamMap: [ :map | 
		map
			at: #owner put: self owner;
			at: #handlers put: self handlers ]
]

{ #category : #'*Bloc-Serialization-STON' }
BlDirectEventDispatcher >> stonProcessSubObjects: block [

	"Custom to ignore cycling in BlElement ownership"

	1 to: self class instSize do: [ :each | 
		((self instVarAt: each) isKindOf: BlElement) ifFalse: [ 
			self instVarAt: each put: (block value: (self instVarAt: each)) ] ].
	(self class isVariable and: [ self class isBytes not ]) ifTrue: [ 
		1 to: self basicSize do: [ :each | 
		self basicAt: each put: (block value: (self basicAt: each)) ] ]
]

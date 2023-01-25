Extension { #name : #BlElement }

{ #category : #'*Bloc-Serialization-STON' }
BlElement >> fromSton: stonReader [

	stonReader parseMapDo: [ :key :value | 
		| realValue |
		realValue := value isStonReference
			             ifTrue: [ stonReader resolveReference: value ]
			             ifFalse: [ value ].
		key = #background ifTrue: [ self background: realValue ].
		key = #border ifTrue: [ self border: realValue ].
		key = #children ifTrue: [ self addChildren: realValue ].
		key = #constraints ifTrue: [ self constraints: realValue ].
		key = #geometry ifTrue: [ self geometry: realValue ] ]
]

{ #category : #'*Bloc-Serialization-STON' }
BlElement >> stonOn: stonWriter [

	stonWriter writeObject: self streamMap: [ :dictionary | 
		dictionary at: #background put: self background.
		dictionary at: #border put: self border.
		dictionary at: #children put: self children.
		dictionary at: #constraints put: self constraints.
		dictionary at: #geometry put: self geometry ]
]

{ #category : #'*Bloc-Serialization-STON' }
BlElement >> stonProcessSubObjects: block [

	"Custom to ignore cycling in BlElement ownership"

	1 to: self class instSize do: [ :each | 
		((self instVarAt: each) isKindOf: BlElement) ifFalse: [ 
			self instVarAt: each put: (block value: (self instVarAt: each)) ] ].
	(self class isVariable and: [ self class isBytes not ]) ifTrue: [ 
		1 to: self basicSize do: [ :each | 
		self basicAt: each put: (block value: (self basicAt: each)) ] ]
]

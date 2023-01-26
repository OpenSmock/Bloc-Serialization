Extension { #name : #BlElement }

{ #category : #'*Bloc-Serialization-STON' }
BlElement class >> stonAllInstVarNames [

	^ #( children constraints visuals )
]

{ #category : #'*Bloc-Serialization-STON' }
BlElement >> stonPostReferenceResolution [

	self childrenDo: [ :child | child parent: self ]
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

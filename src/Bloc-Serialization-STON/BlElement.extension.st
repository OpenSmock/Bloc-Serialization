Extension { #name : #BlElement }

{ #category : #'*Bloc-Serialization-STON' }
BlElement class >> stonAllInstVarNames [

	^ #( children constraints visuals userData )
]

{ #category : #'*Bloc-Serialization-STON' }
BlElement >> stonOn: stonWriter [

	| previousData copyData |
	previousData := self userData.
	copyData := previousData copy.
	
	copyData removeKey: #blocProperties ifAbsent: [nil].
	copyData removeKey: #blocStates ifAbsent: [nil].
	copyData removeKey: #blocPreviousMeasurementSpec ifAbsent: [nil].
	copyData removeKey: #blocStyles ifAbsent: [nil].
	
	userData := copyData.
	stonWriter writeObject: self.
	userData := previousData.
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

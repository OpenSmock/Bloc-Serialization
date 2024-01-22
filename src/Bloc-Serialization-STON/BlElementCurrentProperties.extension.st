Extension { #name : #BlElementCurrentProperties }

{ #category : #'*Bloc-Serialization-STON' }
BlElementCurrentProperties >> stonProcessSubObjects: block [
	"Custom to ignore cycling in BlElement ownership"

	super stonProcessSubObjects: block
	"1 to: self class instSize do: [ :each |
		((self instVarAt: each) isKindOf: BlElement) ifFalse: [
			self instVarAt: each put: (block value: (self instVarAt: each)) ] ].
	(self class isVariable and: [ self class isBytes not ]) ifTrue: [
		1 to: self basicSize do: [ :each |
		self basicAt: each put: (block value: (self basicAt: each)) ] ]"
]

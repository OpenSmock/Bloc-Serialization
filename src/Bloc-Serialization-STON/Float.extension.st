Extension { #name : #Float }

{ #category : #'*Bloc-Serialization-STON' }
Float class >> fromSton: aStonReader [

	aStonReader match: 'infinity' do: [ ^ self infinity ].
	^ self nan
]

{ #category : #'*Bloc-Serialization-STON' }
Float >> stonOn: stonWriter [

	self isInfinite
		ifTrue: [ stonWriter writeInfinite ]
		ifFalse: [ stonWriter writeFloat: self asFloat ]
]

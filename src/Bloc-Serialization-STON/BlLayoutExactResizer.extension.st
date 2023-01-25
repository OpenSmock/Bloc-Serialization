Extension { #name : #BlLayoutExactResizer }

{ #category : #'*Bloc-Serialization-STON' }
BlLayoutExactResizer class >> fromSton: stonReader [

	stonReader parseMapDo: [ :key :value | 
		key = #size ifTrue: [ ^ self size: value ] ].
	^ self fifty
]

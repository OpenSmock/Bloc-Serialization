Extension { #name : #BlElement }

{ #category : #'*Bloc-Serialization-STON' }
BlElement class >> fromSton: stonReader [

	| obj |
	obj := self new.
	stonReader parseMapDo: [ :key :value | 
		key = #background ifTrue: [ obj background: value ].
		key = #border ifTrue: [ obj border: value ] ].
	^ obj
]

{ #category : #'*Bloc-Serialization-STON' }
BlElement >> stonOn: stonWriter [

	stonWriter writeObject: self streamMap: [ :dictionary | 
		dictionary at: #background put: self background.
		dictionary at: #border put: self border ]
]

Extension { #name : #Float }

{ #category : #'*Bloc-Serialization-STON' }
Float class >> fromSton: aStonReader [

	aStonReader match: 'infinity' do: [ ^ self infinity ].
	^ self nan
]

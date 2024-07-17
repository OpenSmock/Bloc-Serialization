Extension { #name : #BlBorder }

{ #category : #'*Bloc-Serialization-STON' }
BlBorder class >> fromSton: stonReader [

	^ self basicNew
		  fromSton: stonReader;
		  yourself.
]

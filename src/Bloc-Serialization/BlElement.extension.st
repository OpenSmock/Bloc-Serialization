Extension { #name : #BlElement }

{ #category : #'*Bloc-Serialization' }
BlElement >> serialize [

	^ BlSerializer serialize: self
]

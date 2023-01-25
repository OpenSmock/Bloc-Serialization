Extension { #name : #BlElement }

{ #category : #'*Bloc-Serialization' }
BlElement >> serialize [

	^ BlSerializerSTON serialize: self
]

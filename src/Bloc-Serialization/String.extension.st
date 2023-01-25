Extension { #name : #String }

{ #category : #'*Bloc-Serialization' }
String >> materializeAsBlElement [

	^ BlSerializerSTON materialize: self
]

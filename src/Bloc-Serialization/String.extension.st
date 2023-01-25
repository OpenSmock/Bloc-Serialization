Extension { #name : #String }

{ #category : #'*Bloc-Serialization' }
String >> materializeAsBlElement [

	^ BlSerializer materialize: self
]

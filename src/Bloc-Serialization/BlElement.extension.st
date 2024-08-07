Extension { #name : #BlElement }

{ #category : #'*Bloc-Serialization' }
BlElement >> materializeAsBlElement [

	^ self
]

{ #category : #'*Bloc-Serialization' }
BlElement >> serialize [

	^ BlSerializer serialize: self
]

{ #category : #'*Bloc-Serialization' }
BlElement >> serializeThenMaterialize [

	^ BlSerializer materialize: (BlSerializer serialize: self)
]

{ #category : #'*Bloc-Serialization' }
BlElement >> shouldSerializedChildren [

	^ true
]

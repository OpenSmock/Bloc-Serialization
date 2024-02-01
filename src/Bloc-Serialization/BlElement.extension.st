Extension { #name : #BlElement }

{ #category : #'*Bloc-Serialization' }
BlElement >> isLeaf [

	^ true
]

{ #category : #'*Bloc-Serialization' }
BlElement >> serialize [

	^ BlSerializer serialize: self
]

{ #category : #'*Bloc-Serialization' }
BlElement >> serializeThenMaterialize [

	^ BlSerializer materialize: (BlSerializer serialize: self)
]

Extension { #name : #BlAffineCompositeTransformation }

{ #category : #'*Bloc-Serialization-Stash' }
BlAffineCompositeTransformation >> allSetterAndGettersForMyStash [ 

	^ self transformations flatCollect: [ :each | each allSetterAndGettersForMyStash ]
]

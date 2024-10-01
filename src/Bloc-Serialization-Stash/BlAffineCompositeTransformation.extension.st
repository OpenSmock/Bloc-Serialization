Extension { #name : #BlAffineCompositeTransformation }

{ #category : #'*Bloc-Serialization-Stash' }
BlAffineCompositeTransformation >> stashAccessors [

	<stashAccessors>
	^ self transformations flatCollect: [ :each |
		  each allSetterAndGettersForMyStash ]
]

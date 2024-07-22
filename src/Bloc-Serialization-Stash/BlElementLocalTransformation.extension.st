Extension { #name : #BlElementLocalTransformation }

{ #category : #'*Bloc-Serialization-Stash' }
BlElementLocalTransformation >> stashAccessors [

	<stashAccessors>
	^ self affineTransformation allSetterAndGettersForMyStash
]

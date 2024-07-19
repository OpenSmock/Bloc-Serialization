Extension { #name : #BlElementCachedTransformation }

{ #category : #'*Bloc-Serialization-Stash' }
BlElementCachedTransformation >> asStashObject [

	^ StashBlTransformation new
		  object: self;
		  yourself
]

{ #category : #'*Bloc-Serialization-Stash' }
BlElementCachedTransformation >> stashAccessors [

	<stashAccessors>
	^ self asElementTransformation allSetterAndGettersForMyStash
]

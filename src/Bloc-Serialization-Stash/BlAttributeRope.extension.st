Extension { #name : #BlAttributeRope }

{ #category : #'*Bloc-Serialization-Stash' }
BlAttributeRope >> asStashContructor [

	^ self class printString
]

{ #category : #'*Bloc-Serialization-Stash' }
BlAttributeRope >> asStashObject [

	^ StashBlAttributeRope new
		  object: self;
		rope: self rope;
		attributes: self attributes;
		  yourself
]

{ #category : #'*Bloc-Serialization-Stash' }
BlAttributeRope >> stashAccessors [

	<stashAccessors>
	^ {
		  #attributes.
		  #rope }
]

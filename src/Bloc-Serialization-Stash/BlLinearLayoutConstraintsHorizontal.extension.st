Extension { #name : #BlLinearLayoutConstraintsHorizontal }

{ #category : #'*Bloc-Serialization-Stash' }
BlLinearLayoutConstraintsHorizontal >> stashAccessors [

	<stashAccessors>
	| settersAndGetters |
	settersAndGetters := OrderedCollection new.
	self alignment = BlElementAlignment start horizontal ifFalse: [
		settersAndGetters add:
			[ :n | self alignment asStashSelector ] onlySetOnStash ].

	^ settersAndGetters
]

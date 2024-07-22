Extension { #name : #BlLinearLayoutConstraintsVertical }

{ #category : #'*Bloc-Serialization-Stash' }
BlLinearLayoutConstraintsVertical >> stashAccessors [

	<stashAccessors>
	| settersAndGetters |
	settersAndGetters := OrderedCollection new.
	self alignment = BlElementAlignment start vertical ifFalse: [
		settersAndGetters add:
			[ :n | self alignment asStashSelector ] onlySetOnStash ].

	^ settersAndGetters
]

Extension { #name : #BlFlowLayoutConstraintsVertical }

{ #category : #'*Bloc-Serialization-Stash' }
BlFlowLayoutConstraintsVertical >> stashAccessors [

	<stashAccessors>
	| settersAndGetters |
	settersAndGetters := OrderedCollection new.
	self alignment = BlElementAlignment start vertical ifFalse: [
			settersAndGetters add:
			[ :n | self alignment asStashSelector ] onlySetOnStash ].

	^ settersAndGetters
]

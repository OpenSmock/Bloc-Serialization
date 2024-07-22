Extension { #name : #BlFlowLayoutConstraintsHorizontal }

{ #category : #'*Bloc-Serialization-Stash' }
BlFlowLayoutConstraintsHorizontal >> stashAccessors [

	<stashAccessors>
	| settersAndGetters |
	settersAndGetters := OrderedCollection new.
	self alignment = BlElementAlignment start horizontal ifFalse: [
		settersAndGetters add: [ :n |
			self alignment asStashSelector ] onlySetOnStash ].

	^ settersAndGetters
]

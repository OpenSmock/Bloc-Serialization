Extension { #name : #BlFrameLayoutConstraintsHorizontal }

{ #category : #'*Bloc-Serialization-Stash' }
BlFrameLayoutConstraintsHorizontal >> stashAccessors [

	<stashAccessors>
	| settersAndGetters |
	settersAndGetters := OrderedCollection new.

	self alignment = BlElementAlignment start horizontal ifFalse: [
		settersAndGetters add:
			[ :e | self alignment asStashSelector ] onlySetOnStash ].

	self weight == 1.0 ifFalse: [ settersAndGetters add: [ :e | 'weight: ' , self weight printString ] onlySetOnStash ].

	^ settersAndGetters
]

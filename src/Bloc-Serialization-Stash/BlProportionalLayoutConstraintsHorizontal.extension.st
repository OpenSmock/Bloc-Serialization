Extension { #name : #BlProportionalLayoutConstraintsHorizontal }

{ #category : #'*Bloc-Serialization-Stash' }
BlProportionalLayoutConstraintsHorizontal >> stashAccessors [

	<stashAccessors>
	| settersAndGetters |
	settersAndGetters := OrderedCollection new.

	self left = 0 ifFalse: [
		settersAndGetters add:
			[ :e | 'left: ' , self left printString ] onlySetOnStash ].
	self right = 1 ifFalse: [
		settersAndGetters add:
			[ :e | 'right: ' , self right printString ] onlySetOnStash ].

	^ settersAndGetters
]

Extension { #name : #BlProportionalLayoutConstraintsVertical }

{ #category : #'*Bloc-Serialization-Stash' }
BlProportionalLayoutConstraintsVertical >> stashAccessors [

	<stashAccessors>
	| settersAndGetters |
	settersAndGetters := OrderedCollection new.

	self top = 0 ifFalse: [
		settersAndGetters add:
			[ :e | 'top: ' , self top printString ] onlySetOnStash ].
	self bottom = 1 ifFalse: [
		settersAndGetters add:
			[ :e | 'bottom: ' , self bottom printString ] onlySetOnStash ].

	^ settersAndGetters
]

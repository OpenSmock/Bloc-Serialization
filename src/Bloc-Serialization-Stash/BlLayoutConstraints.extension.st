Extension { #name : #BlLayoutConstraints }

{ #category : #'*Bloc-Serialization-Stash' }
BlLayoutConstraints >> asStashObject [

	^ StashBlLayoutConstraints new
		  object: self;
		  yourself
]

{ #category : #'*Bloc-Serialization-Stash' }
BlLayoutConstraints >> stashAccessors [

	<stashAccessors>
	| settersAndGetters |
	settersAndGetters := OrderedCollection new.
	self horizontal allSetterAndGettersForMyStash ifNotEmpty: [ settersAndGetters add: #horizontal onlyGetOnStash ].
	self vertical allSetterAndGettersForMyStash ifNotEmpty: [ settersAndGetters add: #vertical onlyGetOnStash ].
	^ settersAndGetters
]

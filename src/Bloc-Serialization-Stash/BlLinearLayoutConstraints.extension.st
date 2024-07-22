Extension { #name : #BlLinearLayoutConstraints }

{ #category : #'*Bloc-Serialization-Stash' }
BlLinearLayoutConstraints >> stashAccessorsWeight [

	<stashAccessors>
	weight = 1 ifFalse: [ ^ { #weight } ].
	^ {  }

]

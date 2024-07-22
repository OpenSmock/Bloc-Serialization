Extension { #name : #BlBasicLayout }

{ #category : #'*Bloc-Serialization-Stash' }
BlBasicLayout >> asStashContructor [

	^ 'BlBasicLayout uniqueInstance' 
]

{ #category : #'*Bloc-Serialization-Stash' }
BlBasicLayout >> shouldBeTagged [

	^ false
]

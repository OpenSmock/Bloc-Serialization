Extension { #name : #BlBasicLayout }

{ #category : #'*Bloc-Serialization-Stash' }
BlBasicLayout >> asStashConstructor [

	^ 'BlBasicLayout uniqueInstance' 
]

{ #category : #'*Bloc-Serialization-Stash' }
BlBasicLayout >> shouldBeTagged [

	^ false
]

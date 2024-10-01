Extension { #name : #BlFlowLayout }

{ #category : #'*Bloc-Serialization-Stash' }
BlFlowLayout >> asStashConstructor [

	self orientation isVertical ifTrue: [ ^ 'BlFlowLayout vertical' ].
	^ 'BlFlowLayout horizontal'
]

{ #category : #'*Bloc-Serialization-Stash' }
BlFlowLayout >> stashAccessors [

	<stashAccessors>
	| settersAndGetters |
	settersAndGetters := OrderedCollection new.
	self direction == self defaultDirection ifFalse: [
		settersAndGetters add: #direction ].
	^ settersAndGetters
]

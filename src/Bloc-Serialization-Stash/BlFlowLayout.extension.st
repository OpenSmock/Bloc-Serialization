Extension { #name : #BlFlowLayout }

{ #category : #'*Bloc-Serialization-Stash' }
BlFlowLayout >> allSetterAndGettersForMyStash [

	"We ovverride this method to take into account the default value of alignment"
	<stashAccessors>
	| settersAndGetters |
	settersAndGetters := OrderedCollection new.
	(verticalAlignment == self defaultVerticalAlignment and: [
		 horizontalAlignment == self defaultHorizontalAlignment ]) ifFalse: [
		settersAndGetters addAll: self allSetterAndGettersForMyStashForMyTraits ].
	self direction == self defaultDirection ifFalse: [
		settersAndGetters add: #direction ].
	^ settersAndGetters
]

{ #category : #'*Bloc-Serialization-Stash' }
BlFlowLayout >> asStashConstructor [

	self orientation isVertical ifTrue: [ ^ 'BlFlowLayout vertical' ].
	^ 'BlFlowLayout horizontal'
]

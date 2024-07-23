Extension { #name : #BlRotationTransformation }

{ #category : #'*Bloc-Serialization-Stash' }
BlRotationTransformation >> stashAccessors [

	<stashAccessors>
	| allSetterAndGettersForMyStash |
	allSetterAndGettersForMyStash := OrderedCollection new.
	allSetterAndGettersForMyStash add: ([ :e | self angle ]) onlyGetOnStash.
	allSetterAndGettersForMyStash add: ([ :e | self axis ]) onlyGetOnStash.
	self axis = BlVector zAxis
		ifFalse: [
			allSetterAndGettersForMyStash add: ([ :transform |
				 'rotateBy: ' , transform angle asStashConstructor , 'around:'
				 , transform axis asStashConstructor ] -> self) onlySetOnStash ]
		ifTrue: [
			allSetterAndGettersForMyStash add:
				([ :transform | 'rotateBy: ' , transform angle asStashConstructor ]
				 -> self) onlySetOnStash ].
	^ allSetterAndGettersForMyStash
]

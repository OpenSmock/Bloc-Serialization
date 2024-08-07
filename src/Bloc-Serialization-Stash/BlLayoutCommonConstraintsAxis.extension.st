Extension { #name : #BlLayoutCommonConstraintsAxis }

{ #category : #'*Bloc-Serialization-Stash' }
BlLayoutCommonConstraintsAxis >> stashAccessors [

	<stashAccessors>
	| settersAndGetters |
	settersAndGetters := OrderedCollection new.
	self resizer isMatchParent ifTrue: [
		settersAndGetters add: #matchParent onlySetOnStash ].
	self resizer isFitContent ifTrue: [
		self resizer isFitContentLimited
			ifTrue: [ settersAndGetters add: #fitContentLimited onlySetOnStash ]
			ifFalse: [
			settersAndGetters add: #fitContent onlySetOnStash ] ].
	(self resizer isExact and: [ self resizer size ~= 50.0 ]) ifTrue: [
		settersAndGetters add: #exact: -> [ :c | self resizer size ] ].
	^ settersAndGetters
]

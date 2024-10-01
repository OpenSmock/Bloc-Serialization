Extension { #name : #BlLinearLayout }

{ #category : #'*Bloc-Serialization-Stash' }
BlLinearLayout >> asStashConstructor [

	self isVertical ifTrue: [ ^ 'BlLinearLayout vertical' ].
	^ 'BlLinearLayout horizontal' 
]

{ #category : #'*Bloc-Serialization-Stash' }
BlLinearLayout >> stashAccessors [
	"We ovverride this method to take into account the default value of alignment"

	<stashAccessors>
	| settersAndGetters |
	settersAndGetters := OrderedCollection new.
	cellSpacing == 0.0 ifFalse: [ settersAndGetters add: #cellSpacing ].
	interspace == 0.0 ifFalse: [ settersAndGetters add: #interspace ].
	self direction == self defaultDirection ifFalse: [
		settersAndGetters add: #direction ].
	shouldUseLargestChild ifTrue: [
		settersAndGetters add: ([ :linearLayout |
			 linearLayout shouldUseLargestChild
				 ifTrue: [ #withSpaceEqualization ]
				 ifFalse: [ #withoutSpaceEqualization ] ] -> self) onlySetOnStash ].
	weightSum == self defaultWeightSum ifFalse: [
		settersAndGetters add: #weightSum ].
	^ settersAndGetters
]

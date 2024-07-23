Extension { #name : #BlScalingTransformation }

{ #category : #'*Bloc-Serialization-Stash' }
BlScalingTransformation >> stashAccessors [

	<stashAccessors>
	self scale x = self scale y ifTrue: [
		^ { ([ :transform |
		  'scaleBy: <1s>' expandMacrosWith: transform scale x asStashConstructor ] -> self)
			  onlySetOnStash } ].
	^ { ([ :transform |
	  'scaleBy: <1s> @ <2s>'
		  expandMacrosWith: transform scale x asStashConstructor
		  with: transform scale y asStashConstructor ] -> self) onlySetOnStash }
]

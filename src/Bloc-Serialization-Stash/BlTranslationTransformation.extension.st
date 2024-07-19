Extension { #name : #BlTranslationTransformation }

{ #category : #'*Bloc-Serialization-Stash' }
BlTranslationTransformation >> stashAccessors [

	<stashAccessors>
	^ { ([ :transform |
	  'translateBy: <1s> @ <2s>'
		  expandMacrosWith: transform translation x asStashContructor
		  with: transform translation y asStashContructor ] -> self) onlySetOnStash }
]

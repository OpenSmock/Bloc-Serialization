Extension { #name : #BlTranslationTransformation }

{ #category : #'*Bloc-Serialization-Stash' }
BlTranslationTransformation >> stashAccessors [

	<stashAccessors>
	^ { ([ :transform |
	  'translateBy: <1s> @ <2s>'
		  expandMacrosWith: transform translation x asStashConstructor
		  with: transform translation y asStashConstructor ] -> self) onlySetOnStash }
]

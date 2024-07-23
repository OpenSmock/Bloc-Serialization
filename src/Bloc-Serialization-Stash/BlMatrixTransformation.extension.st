Extension { #name : #BlMatrixTransformation }

{ #category : #'*Bloc-Serialization-Stash' }
BlMatrixTransformation >> stashAccessors [

	<stashAccessors>
	^ { ([ :transform |
	   'matrix: (<1s>)' expandMacrosWith:
		   transform matrix asStashConstructor ] -> self) onlySetOnStash }
]

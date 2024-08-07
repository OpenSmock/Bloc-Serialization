Extension { #name : #BlReflectionTransformation }

{ #category : #'*Bloc-Serialization-Stash' }
BlReflectionTransformation >> stashAccessors [

	<stashAccessors>
	self reflection = (BlVector x: -1 y: 1) ifTrue: [
		^ { (#flipY -> self) onlySetOnStash } ].
	self reflection = (BlVector x: 1 y: -1) ifTrue: [
		^ { (#flipX -> self) onlySetOnStash } ]
]

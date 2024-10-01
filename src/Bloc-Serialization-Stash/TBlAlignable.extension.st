Extension { #name : #TBlAlignable }

{ #category : #'*Bloc-Serialization-Stash' }
TBlAlignable >> defaultStashAlignementTest [

	^ (self verticalAlignment == self defaultVerticalAlignment and: [
		 self horizontalAlignment == self defaultHorizontalAlignment ])
]

{ #category : #'*Bloc-Serialization-Stash' }
TBlAlignable >> stashAccessorForTBlAlignable [

	<stashAccessors>
	self defaultStashAlignementTest ifTrue: [ ^ {  } ]. 
	self isAlignTopLeft ifTrue: [ ^ { #alignTopLeft onlySetOnStash } ].
	self isAlignTopCenter ifTrue: [ ^ { #alignTopCenter onlySetOnStash } ].
	self isAlignTopRight ifTrue: [ ^ { #alignTopRight onlySetOnStash } ].
	self isAlignCenterLeft ifTrue: [
		^ { #alignCenterLeft onlySetOnStash } ].
	self isAlignCenter ifTrue: [ ^ { #alignCenter onlySetOnStash } ].
	self isAlignCenterRight ifTrue: [
		^ { #alignCenterRight onlySetOnStash } ].
	self isAlignBottomLeft ifTrue: [
		^ { #alignBottomLeft onlySetOnStash } ].
	self isAlignBottomCenter ifTrue: [
		^ { #alignBottomCenter onlySetOnStash } ].
	self isAlignBottomRight ifTrue: [
		^ { #alignBottomRight onlySetOnStash } ].
	^ {  }
]

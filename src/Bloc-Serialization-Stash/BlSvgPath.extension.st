Extension { #name : #BlSvgPath }

{ #category : #'*Bloc-Serialization-Stash' }
BlSvgPath >> stashAccessors [

	<stashAccessors>
	| accessors |
	accessors := OrderedCollection new.
	fillRule = EvenOdd ifTrue: [
		accessors add: (#useEvenOddFillRule -> self) onlySetOnStash ].
	accessors add:
		([ :e | 'pathString: (<1p>)' expandMacrosWith: pathString ] -> self)
			onlySetOnStash.
	^ accessors
]

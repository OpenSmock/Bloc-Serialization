Extension { #name : #BlVector2D }

{ #category : #'*Bloc-Serialization-Stash' }
BlVector2D >> asStashConstructor [

	self = BlVector xAxis ifTrue: [ ^ 'BlVector xAxis' ].
	self = BlVector yAxis ifTrue: [ ^ 'BlVector yAxis' ].
	self = BlVector zAxis ifTrue: [ ^ 'BlVector zAxis' ].
	^ 'BlVector x: <1p> y: <2p>' expandMacrosWith: self x with: self y
]

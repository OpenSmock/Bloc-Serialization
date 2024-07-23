Extension { #name : #BlVector3D }

{ #category : #'*Bloc-Serialization-Stash' }
BlVector3D >> asStashConstructor [

	self = BlVector xAxis ifTrue: [ ^ 'BlVector xAxis' ].
	self = BlVector yAxis ifTrue: [ ^ 'BlVector yAxis' ].
	self = BlVector zAxis ifTrue: [ ^ 'BlVector zAxis' ].
	^ 'BlVector x: <1p> y: <2p> z: <3p>' expandMacrosWith: self x with: self y with: self z
]

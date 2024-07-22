Extension { #name : #BlAffineTransformationPositionOrigin }

{ #category : #'*Bloc-Serialization-Stash' }
BlAffineTransformationPositionOrigin >> asStashMethodForTransformationBloc [

	^ 'origin: (<1s> new position: <2s> @ <3s>; yourself)' expandMacrosWith: self class printString with: self position x with: self position y
]

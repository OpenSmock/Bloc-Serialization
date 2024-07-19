Extension { #name : #BlAffineTransformationLeftCenterOrigin }

{ #category : #'*Bloc-Serialization-Stash' }
BlAffineTransformationLeftCenterOrigin >> asStashMethodForTransformationBloc [

	^ 'origin: <1s> new' expandMacrosWith: self class printString.
]

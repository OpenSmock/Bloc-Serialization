Extension { #name : #BlAffineTransformationNormalizedPositionOrigin }

{ #category : #'*Bloc-Serialization-Stash' }
BlAffineTransformationNormalizedPositionOrigin >> asStashMethodForTransformationBloc [

	^ 'normalizedOrigin: <1p> @ <2p>' expandMacrosWith: self position x with: self position y
]

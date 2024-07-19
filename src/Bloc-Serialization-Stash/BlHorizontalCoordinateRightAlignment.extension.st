Extension { #name : #BlHorizontalCoordinateRightAlignment }

{ #category : #'*Bloc-Serialization-Stash' }
BlHorizontalCoordinateRightAlignment >> asStashSelector [

	^ 'alignRightAt: '
	  , self coordinate printString
]

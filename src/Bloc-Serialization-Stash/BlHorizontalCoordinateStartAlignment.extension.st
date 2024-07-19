Extension { #name : #BlHorizontalCoordinateStartAlignment }

{ #category : #'*Bloc-Serialization-Stash' }
BlHorizontalCoordinateStartAlignment >> asStashSelector [

	^ 'alignCenterAt: '
	  , self coordinate printString
]

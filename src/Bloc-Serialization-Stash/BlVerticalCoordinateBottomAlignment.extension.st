Extension { #name : #BlVerticalCoordinateBottomAlignment }

{ #category : #'*Bloc-Serialization-Stash' }
BlVerticalCoordinateBottomAlignment >> asStashSelector [

		^ 'alignBottomAt: ', (self coordinate printString)
]

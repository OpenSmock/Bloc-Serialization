Extension { #name : #BlVerticalCoordinateTopAlignment }

{ #category : #'*Bloc-Serialization-Stash' }
BlVerticalCoordinateTopAlignment >> asStashSelector [


	^ self relativeAlignment asStashSelector, 'At: ' , self coordinate printString
]

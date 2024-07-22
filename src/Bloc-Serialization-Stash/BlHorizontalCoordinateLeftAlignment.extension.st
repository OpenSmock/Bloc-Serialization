Extension { #name : #BlHorizontalCoordinateLeftAlignment }

{ #category : #'*Bloc-Serialization-Stash' }
BlHorizontalCoordinateLeftAlignment >> asStashSelector [

	^ 'alignLeftAt: ' , self coordinate printString
]

Extension { #name : #BlElevation }

{ #category : #'*Bloc-Serialization-Stash' }
BlElevation >> asStashContructor [

	^ self class printString , ' elevation: ' , self elevation printString
]

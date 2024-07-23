Extension { #name : #BlElevation }

{ #category : #'*Bloc-Serialization-Stash' }
BlElevation >> asStashConstructor [

	^ self class printString , ' elevation: ' , self elevation printString
]

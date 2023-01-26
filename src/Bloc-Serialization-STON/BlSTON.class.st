Class {
	#name : #BlSTON,
	#superclass : #STON,
	#category : #'Bloc-Serialization-STON'
}

{ #category : #options }
BlSTON class >> reader [

	^ BlSTONReader new
]

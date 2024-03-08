Extension { #name : #BlDirectEventDispatcher }

{ #category : #'*Bloc-Serialization-STON' }
BlDirectEventDispatcher class >> fromSton: stonReader [

	"Create a new instance and delegate decoding to instance side.
	Override only when new instance should be created directly (see implementors). "

	^ self basicNew initialize;
		  fromSton: stonReader;
		  yourself
]

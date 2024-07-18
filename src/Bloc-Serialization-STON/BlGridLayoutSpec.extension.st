Extension { #name : #BlGridLayoutSpec }

{ #category : #'*Bloc-Serialization-STON' }
BlGridLayoutSpec class >> fromSton: stonReader [
	"Create a new instance and delegate decoding to instance side.
	Override only when new instance should be created directly (see implementors). "

	^ (self start: UNDEFINED)
		fromSton: stonReader;
		yourself
]

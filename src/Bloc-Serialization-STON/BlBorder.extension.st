Extension { #name : #BlBorder }

{ #category : #'*Bloc-Serialization-STON' }
BlBorder class >> fromSton: stonReader [

	| builder |
	builder := self builder.
	stonReader parseMapDo: [ :key :value | 
		key = #paint ifTrue: [ builder paint: value ].
		key = #width ifTrue: [ builder width: value ].
		key = #style ifTrue: [ 
			builder lineCap: value lineCap.
			builder lineJoin: value lineJoin.
			builder miterLimit: value miterLimit.
			builder dashArray: value dashArray.
			builder dashOffset: value dashOffset ].
		key = #opacity ifTrue: [ builder opacity: value ] ].
	^ builder build
]

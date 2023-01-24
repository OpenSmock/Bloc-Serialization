Extension { #name : #BlElement }

{ #category : #'*Bloc-Serialization' }
BlElement class >> fromSton: stonReader [

	| element |
	element := self new.
	stonReader parseMapDo: [ :key :value | 
		key = #constraints ifTrue: [ element constraints: value ].
		key = #children ifTrue: [ element addChildren: value ].
		key = #background ifTrue: [ element background: value ] ].
	^ element
]

{ #category : #'*Bloc-Serialization' }
BlElement class >> materialize: aString [

	^ BlSerializerSTON materialize: aString
]

{ #category : #'*Bloc-Serialization' }
BlElement >> serialize [

	^ BlSerializerSTON serialize: self
]

{ #category : #'*Bloc-Serialization' }
BlElement >> stonOn: stonWriter [

	stonWriter writeObject: self streamMap: [ :dictionary | 
		self id isNoId ifFalse: [ dictionary at: #id put: self id ].
		dictionary
			at: #constraints put: self constraints;
			at: #background put: self background;
			at: #children put: children ]
]

Extension { #name : #BlElement }

{ #category : #'*Bloc-Serialization' }
BlElement class >> fromSton: stonReader [

	| element |
	element := self new.
	stonReader parseMapDo: [ :key :value | 
		key = #children ifTrue: [ element addChildren: value ].
		key = #id ifTrue: [ element id: value ].
		key = #size ifTrue: [ element size: value ].
		key = #position ifTrue: [ element relocate: value ].
		"key = #transformation ifTrue: [ element transformation: value ]."
		"key = #constraints ifTrue: [ element constraints: value ]."
		"key = #layout ifTrue: [ element layout: value ]."

		"Visuals"
		key = #background ifTrue: [ element background: value ].
		"key = #border ifTrue: [ element border: value ]."
		"key = #clipChildren ifTrue: [ element clipChildren: value ]."
		"key = #effect ifTrue: [ element effect: value ]."
		"key = #elevation ifTrue: [ element elevation: value ]."
		"key = #focusability ifTrue: [ element focusability: value ]."
		"key = #focused ifTrue: [ element focused: value ]."
		"key = #mouseCursor ifTrue: [ element mouseCursor: value ]."
		"key = #opacity ifTrue: [ element opacity: value ]."
		"key = #outskirts ifTrue: [ element outskirts: value ]."
		"key = #visibility ifTrue: [ element visibility: value ]."
		"key = #geometry ifTrue: [ element geometry: value ]" ].
	^ element
]

{ #category : #'*Bloc-Serialization' }
BlElement >> stonOn: stonWriter [

	stonWriter writeObject: self streamMap: [ :dictionary | 
		self id isNoId ifFalse: [ dictionary at: #id put: self id ].
		dictionary
			at: #size put: self size;
			at: #position put: self position;
			"at: #transformation put: self transformation;""at: #constraints put: self constraints;""at: #layout put: self layout;""Visuals"
			at: #background
			put: self background;
			"at: #border put: self border""at: #clipChildren put: self clipChildren;""at: #effect put: self effect;""at: #elevation put: self elevation;
			at: #focusability put: self focusability;
			at: #focused put: self focused;"
			"at: #geometry
			put: self geometry;"
			"at: #mouseCursor put: self mouseCursor;
			at: #opacity put: self opacity;
			at: #outskirts put: self outskirts;
			at: #visibility put: self visibility""at: #measuredBounds put: measuredBounds;""at: #boundsCache put: boundsCache;""at: #parent put: parent""at: #eventDispatcher put: eventDispatcher;""at: #constraints put: constraints;""at: #layout put: layout;""at: #transformation put: transformation;""at: #taskQueue put: taskQueue;""at: #errorHandler put: errorHandler;""at: #userData put: userData;""at: #visuals put: visuals;""at: #flags put: flags""at: #spaceReference put: spaceReference;"
			at: #children
			put: children ]
]

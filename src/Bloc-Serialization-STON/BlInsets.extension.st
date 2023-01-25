Extension { #name : #BlInsets }

{ #category : #'*Bloc-Serialization-STON' }
BlInsets class >> fromSton: stonReader [

	| insets |
	insets := self all: 0.0.
	stonReader parseListDo: [ :each :index | 
		index = 1 ifTrue: [ insets withTop: each ].
		index = 2 ifTrue: [ insets withRight: each ].
		index = 3 ifTrue: [ insets withBottom: each ].
		index = 4 ifTrue: [ insets withLeft: each ] ].
	^ insets
]

{ #category : #'*Bloc-Serialization-STON' }
BlInsets >> stonOn: stonWriter [


			stonWriter writeObject: self streamShortList: [ :array | 
				array
					add: self top;
					add: self right;
					add: self bottom;
					add: self left ] 
]

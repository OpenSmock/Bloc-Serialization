Extension { #name : #BlSimpleShadowEffect }

{ #category : #'*Bloc-Serialization-Stash' }
BlSimpleShadowEffect >> asStashConstructor [

	self flag: #ToFix. "Not correct"
	^ 'BlSimpleShadowEffect color: (' , self color asStashConstructor
	  , ') offset: ((' , self offset x printString , ')@('
	  , self offset y printString , '))'
]

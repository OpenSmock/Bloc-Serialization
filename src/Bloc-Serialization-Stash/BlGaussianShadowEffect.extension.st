Extension { #name : #BlGaussianShadowEffect }

{ #category : #'*Bloc-Serialization-Stash' }
BlGaussianShadowEffect >> asStashConstructor [

	self flag: #ToFix. "Not correct".
	^ 'BlGaussianShadowEffect color: (' , self color asStashConstructor
	  , ') width: (' , self width printString , ') offset: (('
	  , self offset x printString , ')@(' , self offset y printString
	  , '))'
]

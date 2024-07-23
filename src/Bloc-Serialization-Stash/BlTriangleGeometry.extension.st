Extension { #name : #BlTriangleGeometry }

{ #category : #'*Bloc-Serialization-Stash' }
BlTriangleGeometry >> asStashConstructor [

	self isTop ifTrue: [ ^ 'BlTriangleGeometry new beTop' ].
	self isBottom ifTrue: [ ^ 'BlTriangleGeometry new beBottom' ].
	self isLeft ifTrue: [ ^ 'BlTriangleGeometry new beLeft' ].
	^ 'BlTriangleGeometry new beRight'
]

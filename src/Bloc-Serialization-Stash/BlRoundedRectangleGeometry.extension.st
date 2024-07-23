Extension { #name : #BlRoundedRectangleGeometry }

{ #category : #'*Bloc-Serialization-Stash' }
BlRoundedRectangleGeometry >> asStashConstructor [

	(self cornerRadii topLeft = self cornerRadii bottomRight and: [
		 self cornerRadii topLeft = self cornerRadii topRight and: [
			 self cornerRadii topLeft = self cornerRadii bottomLeft ] ])
		ifTrue: [
			^ 'BlRoundedRectangleGeometry cornerRadius: '
			  , self cornerRadii topLeft printString ].

	^ 'BlRoundedRectangleGeometry'
]

{ #category : #'*Bloc-Serialization-Stash' }
BlRoundedRectangleGeometry >> asStashObject [

	^ StashObjectWithBuilder new
		  builder: self;
		  methodToBuild: nil;
		  object: self;
		  yourself
]

{ #category : #'*Bloc-Serialization-Stash' }
BlRoundedRectangleGeometry >> stashAccessors [

	<stashAccessors>
	(self cornerRadii topLeft = self cornerRadii bottomRight and: [
		 self cornerRadii topLeft = self cornerRadii topRight and: [
			 self cornerRadii topLeft = self cornerRadii bottomLeft ] ])
		ifTrue: [ ^ {  } ].

	^ { #cornerRadii }
]

Extension { #name : #BlFlowLayoutConstraints }

{ #category : #'*Bloc-Serialization-Stash' }
BlFlowLayoutConstraints >> stashAccessorsNewLine [

	<stashAccessors>
	newLine ifTrue: [ ^ { #newLine: -> #isNewLine } ].
	^ {  }

]

{ #category : #'*Bloc-Serialization-Stash' }
BlFlowLayoutConstraints >> stashAccessorsWeight [

	<stashAccessors>
	weight == 0 ifFalse: [ ^ { #weight } ].
	^ {  }

]

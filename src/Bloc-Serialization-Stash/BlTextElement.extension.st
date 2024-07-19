Extension { #name : #BlTextElement }

{ #category : #'*Bloc-Serialization-Stash' }
BlTextElement >> allSetterAndGettersForMyStash [

	^ super allSetterAndGettersForMyStash , { #text }
]

{ #category : #'*Bloc-Serialization-Stash' }
BlTextElement >> stashAccessors [

	<stashAccessors>
	^ { #text }
]

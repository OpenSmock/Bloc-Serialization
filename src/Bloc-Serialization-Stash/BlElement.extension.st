Extension { #name : #BlElement }

{ #category : #'*Bloc-Serialization-Stash' }
BlElement >> allSetterAndGettersForMyStashChildren [

	<stashAccessors>
	self shouldSerializedChildren ifFalse: [ ^ {  } ].
	self children ifNotEmpty: [
		^ { #addChildren: -> #children } ].
	^ {  }
]

{ #category : #'*Bloc-Serialization-Stash' }
BlElement >> allSetterAndGettersForMyStashConstraints [

	<stashAccessors>
	(constraints allSetterAndGettersForMyStash) ifNotEmpty: [
		^ { #constraintsDo: -> #constraints } ].
	^ {  }
]

{ #category : #'*Bloc-Serialization-Stash' }
BlElement >> allSetterAndGettersForMyStashIdentifier [

	<stashAccessors>
	| elementId |
	self userData at: #elementId ifAbsent: [ ^ {  } ].
	elementId := self userData at: #elementId.
	elementId class = BlElementNoId ifTrue: [ ^ {  } ].
	elementId class = BlElementNamedId ifTrue: [ ^ { #id } ].
	^ { #elementId }
	
]

{ #category : #'*Bloc-Serialization-Stash' }
BlElement >> allSetterAndGettersForMyStashLayout [

	<stashAccessors>
	self layout = self defaultLayout ifFalse: [ ^ { #layout } ].
	^ {  }
]

{ #category : #'*Bloc-Serialization-Stash' }
BlElement >> allSetterAndGettersForMyStashMargin [

	<stashAccessors>
	self margin = BlInsets empty ifFalse: [
		^ { #margin } ].
	^ {  }
]

{ #category : #'*Bloc-Serialization-Stash' }
BlElement >> allSetterAndGettersForMyStashOtherProperties [

	<stashAccessors>
	| settersAndGetters |
	settersAndGetters := OrderedCollection new.
	self visibility
	== (BlElementVisuals classPool at: #DefaultVisibility) ifFalse: [
		settersAndGetters add: #visibility ].
	self clipChildren
	== (BlElementVisuals classPool at: #DefaultClipChildren) ifFalse: [
		settersAndGetters add: #clipChildren ].
	self focusability
	== (BlElementVisuals classPool at: #DefaultFocusability) ifFalse: [
		settersAndGetters add: #focusability ].
	self elevation == (BlElementVisuals classPool at: #DefaultElevation)
		ifFalse: [ settersAndGetters add: #elevation ].
	self focused == (BlElementVisuals classPool at: #DefaultFocused)
		ifFalse: [ settersAndGetters add: #focused ].
	self mouseCursor
	== (BlElementVisuals classPool at: #DefaultMouseCursor) ifFalse: [
		settersAndGetters add: #mouseCursor ].
	^ settersAndGetters
]

{ #category : #'*Bloc-Serialization-Stash' }
BlElement >> allSetterAndGettersForMyStashPadding [

	<stashAccessors>
	self padding = BlInsets empty ifFalse: [ ^ { #padding } ].
	^ {  }
]

{ #category : #'*Bloc-Serialization-Stash' }
BlElement >> allSetterAndGettersForMyStashTransformation [

	<stashAccessors>
	self transformation isIdentity ifFalse: [
		^ { #transformDo: -> #transformation } ].
	^ {  }
]

{ #category : #'*Bloc-Serialization-Stash' }
BlElement >> allSetterAndGettersForMyStashVisuals [

	<stashAccessors>
	| settersAndGetters |
	settersAndGetters := OrderedCollection new.
	self background == BlElementVisuals defaultBackground ifFalse: [
		settersAndGetters add: #background ].
	self border == BlElementVisuals defaultBorder ifFalse: [
		settersAndGetters add: #border ].
	self geometry == BlElementVisuals defaultGeometry ifFalse: [
		settersAndGetters add: #geometry ].
	self effect == (BlElementVisuals classPool at: #DefaultEffect)
		ifFalse: [ settersAndGetters add: #effect ].
	self opacity == (BlElementVisuals classPool at: #DefaultOpacity)
		ifFalse: [ settersAndGetters add: #opacity ].
	self outskirts == (BlElementVisuals classPool at: #DefaultOutskirts)
		ifFalse: [ settersAndGetters add: #outskirts ].
	^ settersAndGetters
]

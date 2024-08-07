Extension { #name : #BlLayoutCommonConstraints }

{ #category : #'*Bloc-Serialization-Stash' }
BlLayoutCommonConstraints >> stashAccessorsForCommonConstraints [
	<stashAccessors>
	| settersAndGetters |
	settersAndGetters := OrderedCollection new.
	
	self flow allSetterAndGettersForMyStash ifNotEmpty: [
		settersAndGetters add: #flow onlyGetOnStash ].
	self frame allSetterAndGettersForMyStash ifNotEmpty: [
		settersAndGetters add: #frame onlyGetOnStash ].
	self grid allSetterAndGettersForMyStash ifNotEmpty: [
		settersAndGetters add: #grid onlyGetOnStash ].
	self linear allSetterAndGettersForMyStash ifNotEmpty: [
		settersAndGetters add: #linear onlyGetOnStash ].
	self proportional allSetterAndGettersForMyStash ifNotEmpty: [
		settersAndGetters add: #proportional onlyGetOnStash ].
	self relative allSetterAndGettersForMyStash ifNotEmpty: [
		settersAndGetters add: #relative onlyGetOnStash ].
	self zoomable allSetterAndGettersForMyStash ifNotEmpty: [
		settersAndGetters add: #zoomable onlyGetOnStash ].
	
	self position = (0 @ 0) ifFalse: [ settersAndGetters add: #position ].
	self padding = BlInsets empty ifFalse: [
		settersAndGetters add: #padding ].
	self margin = BlInsets empty ifFalse: [
		settersAndGetters add: #margin ].

	self maxHeight = Float infinity ifFalse: [
		settersAndGetters add: #maxHeight ].
	self maxWidth = Float infinity ifFalse: [
		settersAndGetters add: #maxWidth ].
	self minHeight = 0 ifFalse: [ settersAndGetters add: #minHeight ].
	self minWidth = 0 ifFalse: [ settersAndGetters add: #minWidth ].

	accountTransformation ifTrue: [
		settersAndGetters add:
			([ :c | #accountTransformation ] -> self) onlySetOnStash ].

	^ settersAndGetters
]

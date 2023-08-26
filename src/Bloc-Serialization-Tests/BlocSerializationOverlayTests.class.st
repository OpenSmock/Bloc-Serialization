Class {
	#name : #BlocSerializationOverlayTests,
	#superclass : #BlocSerializationTests,
	#category : #'Bloc-Serialization-Tests-Core'
}

{ #category : #tests }
BlocSerializationOverlayTests >> testCannotSaveOverlayElementWhenAttached [

	| element overlayElement newElement |
	element := BlElement new id: #overlayedElement.
	overlayElement := BlOverlayElement on: element.
	
	newElement := element serializeThenMaterialize.
	
	"Check original configuration"
	self assert: (element eventDispatcher handlers size = 1).
	self assert: (element eventDispatcher handlers first isKindOf: BlOverlayListener).
		
	"Check new configuration without overlay listeners"
	self assert: (newElement eventDispatcher handlers isEmpty).
		
	"No rupture : preserve attachment for an existing instanciated UI"
	self assert: overlayElement isAttached.
	
]

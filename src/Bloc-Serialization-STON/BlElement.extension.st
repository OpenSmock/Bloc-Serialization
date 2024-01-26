Extension { #name : #BlElement }

{ #category : #'*Bloc-Serialization-STON' }
BlElement class >> stonAllInstVarNames [

	^ #( children constraints visuals userData layout )
]

{ #category : #'*Bloc-Serialization-STON' }
BlElement >> stonOn: stonWriter [

	| previousData copyData |
	previousData := self userData.
	copyData := IdentityDictionary new.
	self stonUserDataOn: copyData.
	
	userData := copyData.
	self isLeaf
		ifTrue: [ self stonOnWithoutChildren: stonWriter ]
		ifFalse: [ self stonOnWithChildren: stonWriter ].
	userData := previousData
]

{ #category : #'*Bloc-Serialization-STON' }
BlElement >> stonOn: stonWriter withInstanceVariables: instanceVariableNames [

	instanceVariableNames  isEmpty
		ifTrue: [
		stonWriter writeObject: self do: [ stonWriter encodeMap: #(  ) ] ]
		ifFalse: [
			stonWriter writeObject: self streamMap: [ :dictionary |
				(instanceVariableNames ) do: [
					:each |
					(self instVarNamed: each)
						ifNotNil: [ :value | dictionary at: each asSymbol put: value ]
						ifNil: [
							self stonShouldWriteNilInstVars ifTrue: [
								dictionary at: each asSymbol put: nil ] ] ] ] ]
]

{ #category : #'*Bloc-Serialization-STON' }
BlElement >> stonOnWithChildren: stonWriter [

	self stonOn: stonWriter withInstanceVariables: (self class stonAllInstVarNames)
]

{ #category : #'*Bloc-Serialization-STON' }
BlElement >> stonOnWithoutChildren: stonWriter [


	self
		stonOn: stonWriter
		withInstanceVariables: (self class stonAllInstVarNames reject: [ :each | each = #children ])
	
]

{ #category : #'*Bloc-Serialization-STON' }
BlElement >> stonPostReferenceResolution [

	self childrenDo: [ :child | child parent: self ]
]

{ #category : #'*Bloc-Serialization-STON' }
BlElement >> stonProcessSubObjects: block [
	"Custom to ignore cycling in BlElement ownership"

	| instanceVariables instanceToRemove |
	instanceVariables := self class stonAllInstVarNames.
	instanceToRemove := OrderedCollection new.
	self isLeaf ifTrue: [
		instanceToRemove add: #children ].
	visuals = BlDefaultVisuals uniqueInstance ifTrue: [ instanceToRemove add: #visuals ].
	instanceVariables := instanceVariables reject: [ :each | instanceToRemove includes: each ]. 
	instanceVariables do: [ :each |
		self
			instVarNamed: each
			put: (block value: (self instVarNamed: each)) ]
]

{ #category : #'*Bloc-Serialization-STON' }
BlElement >> stonUserDataOn: aIdentityDictionary [

	self userData
		at: #elementId
		ifPresent: [ :id | aIdentityDictionary at: #elementId put: id ]
]

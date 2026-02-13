Class {
	#name : #BaselineOfBlocSerialization,
	#superclass : #BaselineOf,
	#category : #BaselineOfBlocSerialization
}

{ #category : #baselines }
BaselineOfBlocSerialization >> baseline: spec [

	<baseline>
	spec for: #common do: [ "dependencies"
		self dependency: spec.
		
		"project packages"
		spec package: 'Bloc-Serialization-STON'.
		spec package: 'Bloc-Serialization-Stash'.
		spec package: 'Bloc-Serialization' with: [
			spec requires: #( 'Bloc' 'Bloc-Serialization-STON' 'Bloc-Serialization-Stash'
			   'Ston' 'StashSerialization' ) ].
		spec
			package: 'Bloc-Serialization-Tests'
			with: [ spec requires: #( 'Bloc-Serialization' ) ] ]
]

{ #category : #accessing }
BaselineOfBlocSerialization >> dependency: spec [

	"Serialization backends"
	spec
		baseline: 'Ston'
		with: [ spec repository: 'github://svenvc/ston/repository' ].

	spec
		baseline: 'StashSerialization'
		with: [ spec repository: 'github://OpenSmock/Stash/src' ].

	"Graphic librairies: this section should be removed when librairies will be integrated in Pharo"
	spec
		baseline: 'Alexandrie'
		with: [ spec repository: 'github://ThalesGroup/Alexandrie:dev' ].

	spec
		baseline: 'Bloc'
		with: [ spec repository: 'github://ThalesGroup/Bloc:dev' ].
]

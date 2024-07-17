Class {
	#name : #BaselineOfBlocSerialization,
	#superclass : #BaselineOf,
	#category : #BaselineOfBlocSerialization
}

{ #category : #baselines }
BaselineOfBlocSerialization >> baseline: spec [

	<baseline>
	spec for: #common do: [ "dependencies"
		spec
			baseline: 'Ston'
			with: [ spec repository: 'github://svenvc/ston/repository' ].

		spec
			baseline: 'StashSerialization'
			with: [ spec repository: 'github://Nyan11/Stash/src' ].

		spec
			baseline: 'Bloc'
			with: [ spec repository: 'github://pharo-graphics/Bloc:master/src' ].

		"project packages"
		spec package: 'Bloc-Serialization-STON'.
		spec package: 'Bloc-Serialization' with: [
			spec requires: #( 'Bloc' 'Bloc-Serialization-STON'
			   'Ston' 'StashSerialization' ) ].
		spec
			package: 'Bloc-Serialization-Tests'
			with: [ spec requires: #( 'Bloc-Serialization' ) ] ]
]

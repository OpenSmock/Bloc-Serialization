Class {
	#name : #BaselineOfBlocSerialization,
	#superclass : #BaselineOf,
	#category : #BaselineOfBlocSerialization
}

{ #category : #baselines }
BaselineOfBlocSerialization >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		spec package: 'Bloc-Serialization-STON'.
		spec package: 'Bloc-Serialization' with: [ 
			spec requires: #( 'Bloc' 'Bloc-Serialization-STON'
			   'Ston' ) ].
		spec
			baseline: 'Ston'
			with: [ spec repository: 'github://svenvc/ston/repository' ].
		spec
			baseline: 'Bloc'
			with: [ 
			spec repository: 'github://pharo-graphics/Bloc:dev-1.0/src' ] ]
]

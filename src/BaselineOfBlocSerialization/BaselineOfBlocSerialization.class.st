Class {
	#name : #BaselineOfBlocSerialization,
	#superclass : #BaselineOf,
	#category : #BaselineOfBlocSerialization
}

{ #category : #baselines }
BaselineOfBlocSerialization >> baseline: spec [

	<baseline>
	spec for: #common do: [
		spec
			package: 'Bloc-Serialization'
			with: [ spec requires: #( 'Bloc' ) ].
		spec
			baseline: 'Bloc'
			with: [ 
			spec repository: 'github://pharo-graphics/Bloc:dev-1.0/src' ] ]
]

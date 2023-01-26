Class {
	#name : #BlSTONReader,
	#superclass : #STONReader,
	#category : #'Bloc-Serialization-STON'
}

{ #category : #enumerating }
BlSTONReader >> parseConstantDo: block [

	"Custom to include Float infinite"

	readStream peek = $t ifTrue: [ 
		^ self match: 'true' do: [ block value: true ] ].
	readStream peek = $f ifTrue: [ 
		^ self match: 'false' do: [ block value: false ] ].
	readStream peek = $i ifTrue: [ 
	self match: 'infinite' do: [ block value: Float infinity ]].
	readStream peek = $n ifTrue: [ 
		readStream next.
		readStream peek = $i ifTrue: [ 
			self match: 'il' do: [ block value: nil ] ].
		readStream peek = $u ifTrue: [ 
			self match: 'ull' do: [ block value: nil ] ] ]
]

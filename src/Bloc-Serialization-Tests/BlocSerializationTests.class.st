Class {
	#name : #BlocSerializationTests,
	#superclass : #TestCase,
	#category : #'Bloc-Serialization-Tests-Core'
}

{ #category : #utilities }
BlocSerializationTests >> serializeThenMaterialize: aBlElement [

	^ aBlElement serialize materializeAsBlElement
]

{ #category : #utilities }
BlocSerializationTests >> test: aBlElement on: aTestBloc [
	"This method take a blElement, execute a Bloc with assertions inside (from test implementation) for this blElement. The blElement is serialized and rebuild, the new blElement rebuild is re-tested by the Bloc with assertions to confirm the good serialization process "

	| newBlElement |

	"Execute the test bloc with the BlElement before serialization"
	aTestBloc value: aBlElement.

	"Serialize the blElement for building a new blElement which should be with same properties"
	newBlElement := self serializeThenMaterialize: aBlElement.

	"Re-execute the test bloc with the new BlElement after materialization to confirm that the new object have same properties than the previous"
	aTestBloc value: newBlElement
]

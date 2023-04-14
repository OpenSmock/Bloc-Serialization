# Bloc-Serialization
Bloc serialization features to store/unstore BlElements.

## How to use

### Serialization

Use this method to serialize any BlElement into a String.

```smalltalk
string := BlElement new serialize.
```

### Materialization (Deserialization)

Use this method to materialize any serialized String into a BlElement.

```smalltalk
blElement := string materializeAsBlElement.
```

## Installation

```smalltalk
Metacello new
	baseline: 'BlocSerialization';
	repository: 'github://OpenSmock/Bloc-Serialization:main/src';
	load.
```

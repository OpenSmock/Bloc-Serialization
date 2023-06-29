[![License](https://img.shields.io/github/license/openSmock/Bloc-Serialization.svg)](./LICENSE)
[![Pharo 11 CI](https://github.com/OpenSmock/Bloc-Serialization/actions/workflows/Pharo11CI.yml/badge.svg)](https://github.com/OpenSmock/Bloc-Serialization/actions/workflows/Pharo11CI.yml)

# Bloc-Serialization

Bloc serialization features to store/unstore BlElements.

## How to use

### Serialization

Use this method to serialize any BlElement into a String.

```smalltalk
blElement := BlElement new.

string := blElement serialize.
```

Use same method to serialize a list of BlElement into a String.

```smalltalk
oc := OrderedCollection new.
oc add: BlElement new.
oc add: BlElement new.
oc add: BlElement new.

string := oc serialize.
```

### Materialization (Deserialization)

Use this method to materialize any serialized String into a BlElement.
Of course, you need to know that the string is a serialized BlElement.

```smalltalk
blElement := string materializeAsBlElement.
```

Use this method to materialize any serialized String into a BlElement collection.
Of course, you need to know that the string is a serialized Collection.

```smalltalk
oc := string materializeAsBlElement.
```

### Exception / Error

Serialization or Materialization process return some exceptions in case of problems : 
- `BlocSerializerError`
>  `BlocSerializationError`
> `BlocMaterializationError`

## Installation

```smalltalk
Metacello new
	baseline: 'BlocSerialization';
	repository: 'github://OpenSmock/Bloc-Serialization:main/src';
	load.
```

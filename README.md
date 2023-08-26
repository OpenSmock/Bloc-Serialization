[![License](https://img.shields.io/github/license/openSmock/Bloc-Serialization.svg)](./LICENSE)
[![Pharo 11 CI](https://github.com/OpenSmock/Bloc-Serialization/actions/workflows/Pharo11CI.yml/badge.svg)](https://github.com/OpenSmock/Bloc-Serialization/actions/workflows/Pharo11CI.yml)

# Bloc-Serialization

Bloc serialization features to store/unstore BlElements.

## Getting Started

### Installation

To install Bloc-Serialization on your Pharo image you can just execute the following script:

```smalltalk
Metacello new
	baseline: 'BlocSerialization';
	repository: 'github://OpenSmock/Bloc-Serialization:main/src';
	load.
```

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

Tips : you can quickly copy a `BlElement` using `BlElement>>serializeThenMaterialize`.
```smalltalk
element := BlElement new.
copy := element serializeThenMaterialize.
```

### Exception / Error

Serialization or Materialization process return some exceptions in case of problems : 
- `BlocSerializerError`
>  `BlocSerializationError`
> `BlocMaterializationError`

## Serialization backends

Actually `STON` is the only backend used for serialization. The project architecture allow to add anothers serialization backends if needed.

## Dependencies

- [Bloc](https://github.com/pharo-graphics/Bloc)
- [STON](https://github.com/svenvc/ston)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

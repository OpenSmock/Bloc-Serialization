[![Pharo 11](https://img.shields.io/badge/Pharo-11-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo 12](https://img.shields.io/badge/Pharo-12-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo 13](https://img.shields.io/badge/Pharo-13-%23aac9ff.svg)](https://pharo.org/download)

[![License](https://img.shields.io/github/license/OpenSmock/Bloc-Serialization.svg)](./LICENSE)
[![Unit tests](https://github.com/OpenSmock/Bloc-Serialization/actions/workflows/CI.yml/badge.svg)](https://github.com/OpenSmock/Bloc-Serialization/actions/workflows/CI.yml)

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

`Stash` and `STON` can be used as serialization backends.

The project architecture is flexible enough to accommodate the addition of more serialization backends if required.

## Dependencies

- [Stash](https://github.com/OpenSmock/stash)
- [STON](https://github.com/svenvc/ston)
- [Alexandrie](https://github.com/pharo-graphics/Alexandrie)
- [Bloc](https://github.com/pharo-graphics/Bloc)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
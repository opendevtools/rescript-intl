# [4.0.0](https://github.com/opendevtools/rescript-intl/compare/v3.0.0...v4.0.0) (2022-02-03)


### Features

* make currency option required ([e8feb72](https://github.com/opendevtools/rescript-intl/commit/e8feb72413ef0061ea43d96841a29657356cb24e))


### BREAKING CHANGES

* When the `style` of `NumberFormat` is set to
`currency`, the `currency` option is required as it does not
have a default value.

https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat/NumberFormat#parameters

# [3.0.0](https://github.com/opendevtools/rescript-intl/compare/v2.2.0...v3.0.0) (2022-02-03)


### Features

* add ListFormat ([d4c6b23](https://github.com/opendevtools/rescript-intl/commit/d4c6b23a469f1a612816da57ecdceaa6fa347378))
* simplify DateTime and NumberFormat ([f7a80fe](https://github.com/opendevtools/rescript-intl/commit/f7a80fe38d2b3ac96054917f40363e205a57147c))


### BREAKING CHANGES

* #twoDigit changed to #"2-digit"

# [2.2.0](https://github.com/opendevtools/rescript-intl/compare/v2.1.1...v2.2.0) (2021-11-03)


### Features

* add dateStyle and timeStyle ([614ad76](https://github.com/opendevtools/rescript-intl/commit/614ad7652dac6a0c69286dfb6fedadb3e1b220d3))

## [2.1.1](https://github.com/opendevtools/rescript-intl/compare/v2.1.0...v2.1.1) (2021-02-24)


### Bug Fixes

* update bsconfig.json ([#3](https://github.com/opendevtools/rescript-intl/issues/3)) ([419eba3](https://github.com/opendevtools/rescript-intl/commit/419eba31da6d0d405e1642a334459d6d00b494ca))

# [2.1.0](https://github.com/opendevtools/rescript-intl/compare/v2.0.1...v2.1.0) (2021-02-18)


### Features

* **numberformat:** add percentage formatting ([3f2ae70](https://github.com/opendevtools/rescript-intl/commit/3f2ae70814427469d6bdd75b9727886e2f04dc96))

## [2.0.1](https://github.com/opendevtools/rescript-intl/compare/v2.0.0...v2.0.1) (2021-02-18)


### Bug Fixes

* publish in opendevtools organization ([1c3c9a1](https://github.com/opendevtools/rescript-intl/commit/1c3c9a1345c6564cff10f82c4db49493b344cc11))

# [2.0.0](https://github.com/believer/re-intl/compare/v1.0.0...v2.0.0) (2020-07-07)


### Features

* update to bucklescript 8.1 syntax ([6ca32dc](https://github.com/believer/re-intl/commit/6ca32dc3ce1f3e6757e320b5ef034a3149342a1c))


### BREAKING CHANGES

* New syntax is only available in bs-platform >= 8.1

# 1.0.0 (2020-03-18)


### Features

* initial commit ([a00161b](https://github.com/believer/re-intl/commit/a00161b9aa5827d7ba80940396d21c67f136e61f))

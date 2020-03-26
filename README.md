# re-intl

[![npm version](https://badge.fury.io/js/re-intl.svg)](https://badge.fury.io/js/re-intl)
[![](https://github.com/believer/re-intl/workflows/Release/badge.svg)](https://github.com/believer/re-intl/actions?workflow=Release)

`re-intl` helps you with date, number and currency formatting in ReasonML
(BuckleScript). Everything is built on top of `Intl` which comes built-in with
browsers >= IE11 as well as Node.

## Get started

```
npm install re-intl
```

Add `re-intl` in `bsconfig.json`

```
{
  "dependencies": ["re-intl"]
}
```

## Examples

### DateTime

```reason
let today = Intl.DateTime.make(~locale=Some("sv-SE"), ());
// today: string = 2020-03-18 (based on current date)
```

with custom date

```reason
let date = Js.Date.makeWithYMD(~year=2020., ~month=11., ~date=12., ());

let futureDate = Intl.DateTime.make(~date, ~locale=Some("sv-SE"), ());
// futureDate: string = 2020-11-12
```

with date as string

```reason
let futureDate = Intl.DateTime.makeFromString(~date="2020-11-12", ~locale=Some("sv-SE"), ());
// futureDate: string = 2020-11-12
```

and with some `options`

```reason
let today =
  Intl.DateTime.make(
    ~locale=Some("sv-SE"),
    ~options=
      Options.make(
        ~year=Some(`numeric),
        ~weekday=Some(`long),
        ~day=Some(`twoDigit),
        ~era=Some(`narrow),
        ~month=Some(`long),
        (),
      ),
    (),
  );
// today: onsdag 18 mars 2020 e.Kr. (based on current date)
```

### NumberFormat

#### Currency

```reason
let krona =
  Intl.NumberFormat.Currency.make(
    ~value=1000.,
    ~currency=Some("SEK"),
    ~locale=Some("sv-SE"),
    (),
  );
// krona: string = "1 000,00 kr"
```

#### Decimal

```reason
let parsedNumber =
  Intl.NumberFormat.Decimal.make(~value=1000., ~locale=Some("sv-SE"), ());
// parsedNumber: string = "1 000,00"
```

## Node

Node only has support for `en-US` locale by default. If your code is failing
with wrong formatting you'll need to install full locale support using:

```
npm install -g full-icu
```

The installer will print out what you need to set the environment variable `NODE_ICU_DATA` to in order to get full support.


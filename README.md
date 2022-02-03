# rescript-intl

[![](https://github.com/opendevtools/rescript-intl/workflows/Release/badge.svg)](https://github.com/opendevtools/rescript-intl/actions?workflow=Release)
[![npm (scoped)](https://img.shields.io/npm/v/@opendevtools/rescript-intl)](https://npm.im/@opendevtools/rescript-intl)

`rescript-intl` helps you with date, number and currency formatting in ReScript.
Everything is built on top of [Intl](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl) which comes built-in with
browsers >= IE11 as well as Node.

## Get started

```
npm install @opendevtools/rescript-intl
```

Add `rescript-intl` in `bsconfig.json`

```
{
  "dependencies": ["@opendevtools/rescript-intl"]
}
```

## Examples

### DateTime

```reason
let today = Intl.DateTime.make(~locale=Some("sv"), ());
// today: string = "2020-03-18"
```

with custom date

```reason
let date = Js.Date.makeWithYMD(~year=2020., ~month=11., ~date=12., ());

let futureDate = Intl.DateTime.make(~date, ~locale=Some("sv"), ());
// futureDate: string = "2020-12-12"
```

with date as string

```reason
let futureDate = Intl.DateTime.makeFromString(~date="2020-11-12", ~locale=Some("sv"), ());
// futureDate: string = "2020-11-12"
```

and with some `options`

```reason
let today =
  Intl.DateTime.make(
    ~locale=Some("sv"),
    ~options=
      Options.make(
        ~year=Some(#numeric),
        ~weekday=Some(#long),
        ~day=Some(#"2-digit"),
        ~era=Some(#narrow),
        ~month=Some(#long),
        (),
      ),
    (),
  );
// today: string = "onsdag 18 mars 2020 e.Kr".
```

### NumberFormat

#### Currency

```reason
let krona =
  Intl.NumberFormat.Currency.make(
    ~value=1000.,
    ~currency=Some("SEK"),
    ~locale=Some("sv"),
    (),
  );
// krona: string = "1 000,00 kr"
```

#### Decimal

```reason
let parsedNumber =
  Intl.NumberFormat.Decimal.make(~value=1000., ~locale=Some("sv"), ());
// parsedNumber: string = "1 000,00"
```

#### Percent

```reason
let percent =
  Intl.NumberFormat.Percent.make(~value=0.3456., ~locale=Some("sv"), ());
// percent: string = "34,56 %"
```

### ListFormat

```reason
// And based lists (default, #type = #conjunction) in Swedish
let data =
  Intl.ListFormat.make(["Cat", "Tiger", "Lion"], ~locale=Some("sv"), ());
// data: string = "Cat, Tiger och Lion"

// Or based lists
let data =
  Intl.ListFormat.make(["Cat", "Tiger", "Lion"],
  ~options=Options.make(~type_=Some(#disjunction), ()), ());
// data: string = "Cat, Tiger, or Lion"

// Unit based lists
let data =
  Intl.ListFormat.make(["Cat", "Tiger", "Lion"],
  ~options=Options.make(~type_=Some(#unit), ()), ());
// data: string = "Cat, Tiger, Lion"

let data =
  Intl.ListFormat.make(["Cat", "Tiger", "Lion"],
  ~options=Options.make(~type_=Some(#unit), ~style=Some(#narrow), ()), ());
// data: string = "Cat Tiger Lion"
```


Short, `#short`, and narrow, `#narrow`, styles are [only available for `#unit` type](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/ListFormat/ListFormat#parameters). If you pass in any other type than `#unit` with those styles, the library takes care of it and changes the `type` to `#unit`.

## Node

**Node 13 added full ICU support and there should be no issues with wrong
formatting.** If you need to
run a Node version before 13 it only has support for `en-US` locale by default. If your code is failing
with wrong formatting you'll need to install full locale support using:

```
npm install -g full-icu
```

The installer will print out what you need to set the environment variable `NODE_ICU_DATA` to in order to get full support.

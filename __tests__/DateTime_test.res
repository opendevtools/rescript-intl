open Jest
open Expect
open DateTime

beforeAll(() => MockDate.set("2020-01-01"))
afterAll(() => MockDate.reset())

test("default language", () => {
  make() |> expect |> toEqual("1/1/2020")
})

testAll(
  "base formatting of all locales",
  list[
    ("de", "1.1.2020"),
    ("en", "1/1/2020"),
    ("en-GB", "01/01/2020"),
    ("en-US", "1/1/2020"),
    ("es", "1/1/2020"),
    ("es-MX", "1/1/2020"),
    ("fi", "1.1.2020"),
    ("fr", "01/01/2020"),
    ("it", "1/1/2020"),
    ("ja", "2020/1/1"),
    ("ko", "2020. 1. 1."),
    ("nl", "1-1-2020"),
    ("pl", "1.01.2020"),
    ("pt", "01/01/2020"),
    ("pt-BR", "01/01/2020"),
    ("ru", "01.01.2020"),
    ("sv-SE", "2020-01-01"),
    ("zh-CN", "2020/1/1"),
    ("zh-TW", "2020/1/1"),
  ],
  ((locale, expected)) => {
  make(~locale=Some(locale), ()) |> expect |> toEqual(expected)
})

describe("Swedish", () => {
  let formatter = make(~locale=Some("sv-SE"))

  test("base formatting", () => {
    formatter() |> expect |> toEqual("2020-01-01")
  })

  test("custom date", () => {
    let date = Js.Date.makeWithYMD(~year=2020., ~month=2., ~date=18., ())

    formatter(~date, ()) |> expect |> toEqual("2020-03-18")
  })

  test("formats string date", () => {
    makeFromString(~date="2020-03-18", ~locale=Some("sv-SE"), ())
    |> expect
    |> toEqual("2020-03-18")
  })

  testAll(
    "weekday",
    list[(#long, "onsdag"), (#short, "ons"), (#narrow, "O")],
    ((weekday, expected)) => {
    formatter(~options=Options.make(~weekday=Some(weekday), ()), ())
    |> expect
    |> toEqual(expected)
  })

  testAll(
    "era",
    list[
      (#long, "1 1 2020 efter Kristus"),
      (#short, "1 1 2020 e.Kr."),
      (#narrow, "1 1 2020 e.Kr."),
    ],
    ((era, expected)) => {
    formatter(~options=Options.make(~era=Some(era), ()), ())
    |> expect
    |> toEqual(expected)
  })

  testAll("day", list[(#numeric, "1"), (#twoDigit, "01")], ((day, expected)) => {
    formatter(~options=Options.make(~day=Some(day), ()), ())
    |> expect
    |> toEqual(expected)
  })

  testAll(
    "month",
    list[
      (#long, "januari"),
      (#short, "jan."),
      (#narrow, "J"),
      (#numeric, "1"),
      (#twoDigit, "01"),
    ],
    ((month, expected)) => {
    formatter(~options=Options.make(~month=Some(month), ()), ())
    |> expect
    |> toEqual(expected)
  })

  testAll(
    "year", list[(#numeric, "2020"), (#twoDigit, "20")], ((year, expected)) => {
    formatter(~options=Options.make(~year=Some(year), ()), ())
    |> expect
    |> toEqual(expected)
  })

  test("all options", () => {
    make(
      ~locale=Some("sv-SE"),
      ~options=
        Options.make(
          ~year=Some(#numeric),
          ~weekday=Some(#long),
          ~day=Some(#twoDigit),
          ~era=Some(#narrow),
          ~month=Some(#long),
          (),
        ),
      (),
    )
    |> expect
    |> toEqual("onsdag 01 januari 2020 e.Kr.")
  })
})

let today =
  Intl.DateTime.make(
    ~locale=Some("sv-SE"),
    ~options=
      Options.make(
        ~year=Some(#numeric),
        ~weekday=Some(#long),
        ~day=Some(#twoDigit),
        ~era=Some(#narrow),
        ~month=Some(#long),
        (),
      ),
    (),
  )

let date = Js.Date.makeWithYMD(~year=2020., ~month=11., ~date=12., ())

let futureDate = Intl.DateTime.make(~date, ~locale=Some("sv-SE"), ())

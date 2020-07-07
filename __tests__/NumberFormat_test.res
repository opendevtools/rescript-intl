open Jest
open Expect
open NumberFormat

/*
   Intl uses non-breaking space and not a normal space.
   It also uses an actual minus sign (\u2212) and not a
   hyphen-minus (\x2D) which keyboards use.
   So we need to set those manually in our matchers
 */

testAll(
  "EUR - base formatting of all locales",
  list[
    ("de", j`1.000,00\xA0€`),
    ("en", j`€1,000.00`),
    ("en-GB", j`€1,000.00`),
    ("en-US", j`€1,000.00`),
    ("es", j`1000,00\xA0€`),
    ("es-MX", j`EUR\xA01000.00`),
    ("fi", j`1\xA0000,00\xA0€`),
    ("it", j`1.000,00\xA0€`),
    ("ja", j`€1,000.00`),
    ("ko", j`€1,000.00`),
    ("nl", j`€\xA01.000,00`),
    ("pl", j`1000,00\xA0€`),
    ("pt", j`€\xA01.000,00`),
    ("pt-BR", j`€\xA01.000,00`),
    ("ru", j`1\xA0000,00\xA0€`),
    ("sv-SE", j`1\xA0000,00\xA0€`),
    ("zh-CN", j`€1,000.00`),
    ("zh-TW", j`€1,000.00`),
  ],
  ((locale, expected)) => {
  Currency.make(
    ~value=1000.,
    ~currency=Some("EUR"),
    ~locale=Some(locale),
    (),
  )
  |> expect
  |> toEqual(expected)
})

describe("Swedish", () => {
  test("base for decimal", () => {
    Decimal.make(~value=1000., ~locale=Some("sv-SE"), ())
    |> expect
    |> toEqual(j`1\xA0000,00`)
  })

  test("base for SEK", () => {
    Currency.make(
      ~value=1000.,
      ~currency=Some("SEK"),
      ~locale=Some("sv-SE"),
      (),
    )
    |> expect
    |> toEqual(j`1\xA0000,00\xA0kr`)
  })
})

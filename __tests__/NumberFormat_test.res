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
  list{
    ("de", `1.000,00\xA0€`),
    ("en", `€1,000.00`),
    ("en-GB", `€1,000.00`),
    ("en-US", `€1,000.00`),
    ("es", `1000,00\xA0€`),
    ("es-MX", `EUR\xA01,000.00`),
    ("fi", `1\xA0000,00\xA0€`),
    ("it", `1.000,00\xA0€`),
    ("ja", `€1,000.00`),
    ("ko", `€1,000.00`),
    ("nl", `€\xA01.000,00`),
    ("pl", `1000,00\xA0€`),
    ("pt", `€\xA01.000,00`),
    ("pt-BR", `€\xA01.000,00`),
    ("ru", `1\xA0000,00\xA0€`),
    ("sv", `1\xA0000,00\xA0€`),
    ("zh-CN", `€1,000.00`),
    ("zh-TW", `€1,000.00`),
  },
  ((locale, expected)) => {
    Currency.make(~value=1000., ~currency="EUR", ~locale=Some(locale), ())
    |> expect
    |> toEqual(expected)
  },
)

describe("Swedish", () => {
  test("base for decimal", () => {
    Decimal.make(~value=1000., ~locale=Some("sv"), ()) |> expect |> toEqual(`1\xA0000,00`)
  })

  test("base for SEK", () => {
    Currency.make(~value=1000., ~currency="SEK", ~locale=Some("sv"), ())
    |> expect
    |> toEqual(`1\xA0000,00\xA0kr`)
  })
})

describe("Percent", () => {
  test("formats percentages", () => {
    Percent.make(~value=1., ~locale=Some("sv"), ()) |> expect |> toEqual("100\xA0%")
  })

  test("formats percentages with decimals", () => {
    Percent.make(
      ~value=0.3456,
      ~locale=Some("sv"),
      ~minimumFractionDigits=Some(2),
      ~maximumFractionDigits=Some(2),
      (),
    )
    |> expect
    |> toEqual("34,56\xA0%")
  })
})

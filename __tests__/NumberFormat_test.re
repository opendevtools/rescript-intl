open Jest;
open Expect;
open NumberFormat;

/*
   Intl uses non-breaking space and not a normal space.
   It also uses an actual minus sign (\u2212) and not a
   hyphen-minus (\x2D) which keyboards use.
   So we need to set those manually in our matchers
 */

testAll(
  "EUR - base formatting of all locales",
  [
    ("de", {j|1.000,00\xA0€|j}),
    ("en", {j|€1,000.00|j}),
    ("en-GB", {j|€1,000.00|j}),
    ("en-US", {j|€1,000.00|j}),
    ("es", {j|1000,00\xA0€|j}),
    ("es-MX", "EUR\xA01000.00"),
    ("fi", {j|1\xA0000,00\xA0€|j}),
    ("it", {j|1.000,00\xA0€|j}),
    ("ja", {j|€1,000.00|j}),
    ("ko", {j|€1,000.00|j}),
    ("nl", {j|€\xA01.000,00|j}),
    ("pl", {j|1000,00\xA0€|j}),
    ("pt", {j|€\xA01.000,00|j}),
    ("pt-BR", {j|€\xA01.000,00|j}),
    ("ru", {j|1\xA0000,00\xA0€|j}),
    ("sv-SE", {j|1\xA0000,00\xA0€|j}),
    ("zh-CN", {j|€1,000.00|j}),
    ("zh-TW", {j|€1,000.00|j}),
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
});

describe("Swedish", () => {
  test("base for decimal", () => {
    Decimal.make(~value=1000., ~locale=Some("sv-SE"), ())
    |> expect
    |> toEqual({j|1\xA0000,00|j})
  });

  test("base for SEK", () => {
    Currency.make(
      ~value=1000.,
      ~currency=Some("SEK"),
      ~locale=Some("sv-SE"),
      (),
    )
    |> expect
    |> toEqual({j|1\xA0000,00\xA0kr|j})
  });
});

open Jest
open Expect
open ListFormat

test("handles default formatting", () => {
  make(["Cat", "Tiger", "Lion"], ()) |> expect |> toEqual("Cat, Tiger, and Lion")
})

test("handles conjunctions", () => {
  make(["Cat", "Tiger", "Lion"], ~options=Options.make(~type_=Some(#conjunction), ()), ())
  |> expect
  |> toEqual("Cat, Tiger, and Lion")
})

test("handles disjunctions", () => {
  make(["Cat", "Tiger", "Lion"], ~options=Options.make(~type_=Some(#disjunction), ()), ())
  |> expect
  |> toEqual("Cat, Tiger, or Lion")
})

test("handles units", () => {
  make(["Cat", "Tiger", "Lion"], ~options=Options.make(~type_=Some(#unit), ()), ())
  |> expect
  |> toEqual("Cat, Tiger, Lion")
})

test("handles short format", () => {
  make(
    ["Cat", "Tiger", "Lion"],
    ~options=Options.make(~type_=Some(#unit), ~style=Some(#short), ()),
    (),
  )
  |> expect
  |> toEqual("Cat, Tiger, Lion")
})

test("handles narrow format", () => {
  make(
    ["Cat", "Tiger", "Lion"],
    ~options=Options.make(~type_=Some(#unit), ~style=Some(#narrow), ()),
    (),
  )
  |> expect
  |> toEqual("Cat Tiger Lion")
})

let cats = ["Cat", "Tiger", "Lion"]
let expectedShort = "Cat, Tiger, Lion"
let expectedNarrow = "Cat Tiger Lion"

testAll(
  "handles invalid style/type pairs",
  list{
    (#conjunction, #narrow, expectedNarrow),
    (#conjunction, #short, expectedShort),
    (#disjunction, #narrow, expectedNarrow),
    (#disjunction, #short, expectedShort),
  },
  ((type_, style, expected)) => {
    make(cats, ~options=Options.make(~style=Some(style), ~type_=Some(type_), ()), ())
    |> expect
    |> toEqual(expected)
  },
)

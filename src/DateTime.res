type intl

module WeekdayEra = {
  type t = [#long | #short | #narrow]
}

module YearDay = {
  type t = [#numeric | #"2-digit"]
}

module Style = {
  type t = [#full | #long | #medium | #short]
}

module Month = {
  type t = [
    | #long
    | #short
    | #narrow
    | #numeric
    | #"2-digit"
  ]
}

module Options = {
  type t = {
    weekday: option<WeekdayEra.t>,
    era: option<WeekdayEra.t>,
    year: option<YearDay.t>,
    day: option<YearDay.t>,
    month: option<Month.t>,
    dateStyle: option<Style.t>,
    timeStyle: option<Style.t>,
  }

  let make = (
    ~weekday=None,
    ~month=None,
    ~year=None,
    ~day=None,
    ~era=None,
    ~dateStyle=None,
    ~timeStyle=None,
    (),
  ) => {
    day,
    era,
    month,
    weekday,
    year,
    dateStyle,
    timeStyle,
  }
}

/*
  Intl.DateTimeFormat
  https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/DateTimeFormat
 */
@new @scope("Intl")
external dateTimeFormat: (option<string>, option<Options.t>) => intl = "DateTimeFormat"

/* Intl.DateTimeFormat.prototype.format() */
@send external format: (intl, Js.Date.t) => string = "format"

let make = (~date=Js.Date.make(), ~locale=None, ~options=?, ()) => {
  locale->dateTimeFormat(options)->format(date)
}

let makeFromString = (
  ~date=Js.Date.make() |> Js.Date.toISOString,
  ~locale=None,
  ~options=?,
  (),
) => {
  locale->dateTimeFormat(options)->format(date |> Js.Date.fromString)
}

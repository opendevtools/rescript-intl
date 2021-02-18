type intl

module WeekdayEra = {
  @deriving({jsConverter: newType})
  type opt = [#long | #short | #narrow]

  include Utils.CreateOption({
    type t = opt
    type abs_t = abs_opt
    let make = optToJs
  })
}

module YearDay = {
  @deriving({jsConverter: newType})
  type opt = [#numeric | @as("2-digit") #twoDigit]

  include Utils.CreateOption({
    type t = opt
    type abs_t = abs_opt
    let make = optToJs
  })
}

module Month = {
  @deriving({jsConverter: newType})
  type opt = [
    | #long
    | #short
    | #narrow
    | #numeric
    | @as("2-digit") #twoDigit
  ]

  include Utils.CreateOption({
    type t = opt
    type abs_t = abs_opt
    let make = optToJs
  })
}

module Options = {
  type t = {
    weekday: option<WeekdayEra.abs_t>,
    era: option<WeekdayEra.abs_t>,
    year: option<YearDay.abs_t>,
    day: option<YearDay.abs_t>,
    month: option<Month.abs_t>,
  }

  let make = (~weekday=None, ~month=None, ~year=None, ~day=None, ~era=None, ()) => {
    day: YearDay.make(day),
    era: WeekdayEra.make(era),
    month: Month.make(month),
    weekday: WeekdayEra.make(weekday),
    year: YearDay.make(year),
  }
}

/*
  Intl.DateTimeFormat
  https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/DateTimeFormat
 */
@new @scope("Intl")
external dateTimeFormat: (option<string>, option<Options.t>) => intl = "DateTimeFormat"

/* Intl.DateTimeFormat.prototype.format() */
@bs.send external format: (intl, Js.Date.t) => string = "format"

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

type intl

module Style = {
  /* Helper for "style" option. #decimal is the browser default */
  @bs.deriving({jsConverter: newType})
  type opt = [ | #currency | #decimal | #unit]

  include Utils.CreateOption({
    type t = opt
    type abs_t = abs_opt
    let make = optToJs
  })
}

/* Options for Intl.NumberFormat */
type options = {
  minimumFractionDigits: option<int>,
  maximumFractionDigits: option<int>,
  style: option<Style.abs_t>,
  currency: option<string>,
}

/*
  Intl.NumberFormat
  https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/NumberFormat
 */
@new @scope("Intl")
external numberFormat: (option<string>, options) => intl = "NumberFormat"

/* Intl.NumberFormat.prototype.format() */
@bs.send external format: (intl, float) => string = "format"

module Currency = {
  let make = (
    ~value,
    ~locale=None,
    ~minimumFractionDigits=Some(2),
    ~maximumFractionDigits=Some(2),
    ~currency=None,
    (),
  ) => {
    locale
    ->numberFormat({
      style: Style.make(Some(#currency)),
      currency: currency,
      maximumFractionDigits: maximumFractionDigits,
      minimumFractionDigits: minimumFractionDigits,
    })
    ->format(value)
  }
}

module Decimal = {
  let make = (
    ~value,
    ~locale=None,
    ~minimumFractionDigits=Some(2),
    ~maximumFractionDigits=Some(2),
    (),
  ) => {
    locale
    ->numberFormat({
      style: Style.make(Some(#decimal)),
      currency: None,
      maximumFractionDigits: maximumFractionDigits,
      minimumFractionDigits: minimumFractionDigits,
    })
    ->format(value)
  }
}
    ->format(value)
  }
}

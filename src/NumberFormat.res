type intl

module Style = {
  /* Helper for "style" option. #decimal is the browser default */
  type t = [#currency | #decimal | #unit | #percent]
}

/* Options for Intl.NumberFormat */
type options = {
  minimumFractionDigits: option<int>,
  maximumFractionDigits: option<int>,
  style: option<Style.t>,
  currency: option<string>,
}

/*
  Intl.NumberFormat
  https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/NumberFormat
 */
@new @scope("Intl")
external numberFormat: (option<string>, options) => intl = "NumberFormat"

/* Intl.NumberFormat.prototype.format() */
@send external format: (intl, float) => string = "format"

module Currency = {
  let make = (
    ~value,
    ~currency,
    ~locale=None,
    ~minimumFractionDigits=Some(2),
    ~maximumFractionDigits=Some(2),
    (),
  ) => {
    locale
    ->numberFormat({
      style: Some(#currency),
      currency: Some(currency),
      maximumFractionDigits,
      minimumFractionDigits,
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
      style: Some(#decimal),
      currency: None,
      maximumFractionDigits,
      minimumFractionDigits,
    })
    ->format(value)
  }
}

module Percent = {
  let make = (
    ~value,
    ~locale=None,
    ~minimumFractionDigits=Some(0),
    ~maximumFractionDigits=Some(0),
    (),
  ) => {
    locale
    ->numberFormat({
      style: Some(#percent),
      currency: None,
      maximumFractionDigits,
      minimumFractionDigits,
    })
    ->format(value)
  }
}

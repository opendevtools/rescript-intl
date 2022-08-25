type intl

module Type = {
  type t = [#conjunction | #disjunction | #unit]
}

module Style = {
  type t = [#long | #short | #narrow]
}

module Options = {
  type t = {
    @as("type")
    type_: option<Type.t>,
    style: option<Style.t>,
  }

  let make = (~style=None, ~type_=None, ()) => {
    type_,
    style,
  }
}

/*
  Intl.ListFormat
  https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/ListFormat/ListFormat
 */
@new @scope("Intl")
external listFormat: (option<string>, option<Options.t>) => intl = "ListFormat"

/* Intl.ListFormat.prototype.format() */
@send external format: (intl, array<string>) => string = "format"

let make = (listData, ~locale=None, ~options=?, ()) => {
  open Options

  let options = switch options {
  | Some({type_, style}) =>
    switch (type_, style) {
    | (Some(#conjunction), Some(#narrow))
    | (Some(#disjunction), Some(#narrow))
    | (Some(#conjunction), Some(#short))
    | (Some(#disjunction), Some(#short)) =>
      Some({type_: Some(#unit), style})
    | _ => options
    }
  | None => None
  }

  locale->listFormat(options)->format(listData)
}

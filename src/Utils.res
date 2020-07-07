module type Config = {
  type t
  type abs_t
  let make: t => abs_t
}

module CreateOption = (Config: Config) => {
  type t = Config.t
  type abs_t = Config.abs_t

  let make = input =>
    switch input {
    | Some(value) => Some(Config.make(value))
    | None => None
    }
}

[@bs.deriving {jsConverter: newType}]
type t = [
  | [@bs.as "de"] `de
  | [@bs.as "en"] `en
  | [@bs.as "en-GB"] `enGB
  | [@bs.as "en-US"] `enUS
  | [@bs.as "es"] `es
  | [@bs.as "es-MX"] `esMX
  | [@bs.as "fi"] `fi
  | [@bs.as "fr"] `fr
  | [@bs.as "it"] `it
  | [@bs.as "ja"] `ja
  | [@bs.as "ko"] `ko
  | [@bs.as "nl"] `nl
  | [@bs.as "pl"] `pl
  | [@bs.as "pt"] `pt
  | [@bs.as "pt-BR"] `ptBR
  | [@bs.as "ru"] `ru
  | [@bs.as "sv"] `sv
  | [@bs.as "sv-SE"] `svSE
  | [@bs.as "zh-CN"] `zhCN
  | [@bs.as "zh-TW"] `zhTW
];

let make =
  fun
  | Some(locale) => Some(tToJs(locale))
  | None => None;

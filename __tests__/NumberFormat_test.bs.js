// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var Jest = require("@glennsl/bs-jest/src/jest.bs.js");
var Caml_option = require("rescript/lib/js/caml_option.js");
var NumberFormat = require("../src/NumberFormat.bs.js");

Jest.testAll("EUR - base formatting of all locales", {
      hd: [
        "de",
        "1.000,00\xA0€"
      ],
      tl: {
        hd: [
          "en",
          "€1,000.00"
        ],
        tl: {
          hd: [
            "en-GB",
            "€1,000.00"
          ],
          tl: {
            hd: [
              "en-US",
              "€1,000.00"
            ],
            tl: {
              hd: [
                "es",
                "1000,00\xA0€"
              ],
              tl: {
                hd: [
                  "es-MX",
                  "EUR\xA01,000.00"
                ],
                tl: {
                  hd: [
                    "fi",
                    "1\xA0000,00\xA0€"
                  ],
                  tl: {
                    hd: [
                      "it",
                      "1.000,00\xA0€"
                    ],
                    tl: {
                      hd: [
                        "ja",
                        "€1,000.00"
                      ],
                      tl: {
                        hd: [
                          "ko",
                          "€1,000.00"
                        ],
                        tl: {
                          hd: [
                            "nl",
                            "€\xA01.000,00"
                          ],
                          tl: {
                            hd: [
                              "pl",
                              "1000,00\xA0€"
                            ],
                            tl: {
                              hd: [
                                "pt",
                                "€\xA01.000,00"
                              ],
                              tl: {
                                hd: [
                                  "pt-BR",
                                  "€\xA01.000,00"
                                ],
                                tl: {
                                  hd: [
                                    "ru",
                                    "1\xA0000,00\xA0€"
                                  ],
                                  tl: {
                                    hd: [
                                      "sv",
                                      "1\xA0000,00\xA0€"
                                    ],
                                    tl: {
                                      hd: [
                                        "zh-CN",
                                        "€1,000.00"
                                      ],
                                      tl: {
                                        hd: [
                                          "zh-TW",
                                          "€1,000.00"
                                        ],
                                        tl: /* [] */0
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }, (function (param) {
        return Jest.Expect.toEqual(param[1], Jest.Expect.expect(NumberFormat.Currency.make(1000, "EUR", Caml_option.some(param[0]), undefined, undefined, undefined)));
      }));

Jest.describe("Swedish", (function (param) {
        Jest.test("base for decimal", (function (param) {
                return Jest.Expect.toEqual("1\xA0000,00", Jest.Expect.expect(NumberFormat.Decimal.make(1000, "sv", undefined, undefined, undefined)));
              }));
        Jest.test("base for SEK", (function (param) {
                return Jest.Expect.toEqual("1\xA0000,00\xA0kr", Jest.Expect.expect(NumberFormat.Currency.make(1000, "SEK", "sv", undefined, undefined, undefined)));
              }));
      }));

Jest.describe("Percent", (function (param) {
        Jest.test("formats percentages", (function (param) {
                return Jest.Expect.toEqual("100\xA0%", Jest.Expect.expect(NumberFormat.Percent.make(1, "sv", undefined, undefined, undefined)));
              }));
        Jest.test("formats percentages with decimals", (function (param) {
                return Jest.Expect.toEqual("34,56\xA0%", Jest.Expect.expect(NumberFormat.Percent.make(0.3456, "sv", 2, 2, undefined)));
              }));
      }));

/*  Not a pure module */

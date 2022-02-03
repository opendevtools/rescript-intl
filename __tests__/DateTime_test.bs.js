// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var Jest = require("@glennsl/bs-jest/lib/js/src/jest.bs.js");
var DateTime = require("../src/DateTime.bs.js");
var Mockdate = require("mockdate");
var Caml_option = require("rescript/lib/js/caml_option.js");

beforeAll(function () {
      Mockdate.set("2020-01-01 14:00");
      
    });

afterAll(function () {
      Mockdate.reset();
      
    });

var today = DateTime.make(undefined, "sv-SE", DateTime.Options.make("long", "long", "numeric", "2-digit", "narrow", undefined, undefined, undefined), undefined);

var date = new Date(2020, 11, 12);

var futureDate = DateTime.make(Caml_option.some(date), "sv-SE", undefined, undefined);

Jest.test("default language", (function (param) {
        return Jest.Expect.toEqual("1/1/2020", Jest.Expect.expect(DateTime.make(undefined, undefined, undefined, undefined)));
      }));

Jest.testAll("base formatting of all locales", {
      hd: [
        "de",
        "1.1.2020"
      ],
      tl: {
        hd: [
          "en",
          "1/1/2020"
        ],
        tl: {
          hd: [
            "en-GB",
            "01/01/2020"
          ],
          tl: {
            hd: [
              "en-US",
              "1/1/2020"
            ],
            tl: {
              hd: [
                "es",
                "1/1/2020"
              ],
              tl: {
                hd: [
                  "es-MX",
                  "1/1/2020"
                ],
                tl: {
                  hd: [
                    "fi",
                    "1.1.2020"
                  ],
                  tl: {
                    hd: [
                      "fr",
                      "01/01/2020"
                    ],
                    tl: {
                      hd: [
                        "it",
                        "1/1/2020"
                      ],
                      tl: {
                        hd: [
                          "ja",
                          "2020/1/1"
                        ],
                        tl: {
                          hd: [
                            "ko",
                            "2020. 1. 1."
                          ],
                          tl: {
                            hd: [
                              "nl",
                              "1-1-2020"
                            ],
                            tl: {
                              hd: [
                                "pl",
                                "1.01.2020"
                              ],
                              tl: {
                                hd: [
                                  "pt",
                                  "01/01/2020"
                                ],
                                tl: {
                                  hd: [
                                    "pt-BR",
                                    "01/01/2020"
                                  ],
                                  tl: {
                                    hd: [
                                      "ru",
                                      "01.01.2020"
                                    ],
                                    tl: {
                                      hd: [
                                        "sv-SE",
                                        "2020-01-01"
                                      ],
                                      tl: {
                                        hd: [
                                          "zh-CN",
                                          "2020/1/1"
                                        ],
                                        tl: {
                                          hd: [
                                            "zh-TW",
                                            "2020/1/1"
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
      }
    }, (function (param) {
        return Jest.Expect.toEqual(param[1], Jest.Expect.expect(DateTime.make(undefined, Caml_option.some(param[0]), undefined, undefined)));
      }));

Jest.describe("Swedish", (function (param) {
        Jest.test("base formatting", (function (param) {
                return Jest.Expect.toEqual("2020-01-01", Jest.Expect.expect(DateTime.make(undefined, "sv-SE", undefined, undefined)));
              }));
        Jest.test("custom date", (function (param) {
                var date = new Date(2020, 2, 18);
                return Jest.Expect.toEqual("2020-03-18", Jest.Expect.expect(DateTime.make(Caml_option.some(date), "sv-SE", undefined, undefined)));
              }));
        Jest.test("formats string date", (function (param) {
                return Jest.Expect.toEqual("2020-03-18", Jest.Expect.expect(DateTime.makeFromString("2020-03-18", "sv-SE", undefined, undefined)));
              }));
        Jest.testAll("weekday", {
              hd: [
                "long",
                "onsdag"
              ],
              tl: {
                hd: [
                  "short",
                  "ons"
                ],
                tl: {
                  hd: [
                    "narrow",
                    "O"
                  ],
                  tl: /* [] */0
                }
              }
            }, (function (param) {
                return Jest.Expect.toEqual(param[1], Jest.Expect.expect(DateTime.make(undefined, "sv-SE", DateTime.Options.make(Caml_option.some(param[0]), undefined, undefined, undefined, undefined, undefined, undefined, undefined), undefined)));
              }));
        Jest.testAll("era", {
              hd: [
                "long",
                "1 1 2020 efter Kristus"
              ],
              tl: {
                hd: [
                  "short",
                  "1 1 2020 e.Kr."
                ],
                tl: {
                  hd: [
                    "narrow",
                    "1 1 2020 e.Kr."
                  ],
                  tl: /* [] */0
                }
              }
            }, (function (param) {
                return Jest.Expect.toEqual(param[1], Jest.Expect.expect(DateTime.make(undefined, "sv-SE", DateTime.Options.make(undefined, undefined, undefined, undefined, Caml_option.some(param[0]), undefined, undefined, undefined), undefined)));
              }));
        Jest.testAll("day", {
              hd: [
                "numeric",
                "1"
              ],
              tl: {
                hd: [
                  "2-digit",
                  "01"
                ],
                tl: /* [] */0
              }
            }, (function (param) {
                return Jest.Expect.toEqual(param[1], Jest.Expect.expect(DateTime.make(undefined, "sv-SE", DateTime.Options.make(undefined, undefined, undefined, Caml_option.some(param[0]), undefined, undefined, undefined, undefined), undefined)));
              }));
        Jest.testAll("month", {
              hd: [
                "long",
                "januari"
              ],
              tl: {
                hd: [
                  "short",
                  "jan."
                ],
                tl: {
                  hd: [
                    "narrow",
                    "J"
                  ],
                  tl: {
                    hd: [
                      "numeric",
                      "1"
                    ],
                    tl: {
                      hd: [
                        "2-digit",
                        "01"
                      ],
                      tl: /* [] */0
                    }
                  }
                }
              }
            }, (function (param) {
                return Jest.Expect.toEqual(param[1], Jest.Expect.expect(DateTime.make(undefined, "sv-SE", DateTime.Options.make(undefined, Caml_option.some(param[0]), undefined, undefined, undefined, undefined, undefined, undefined), undefined)));
              }));
        Jest.testAll("year", {
              hd: [
                "numeric",
                "2020"
              ],
              tl: {
                hd: [
                  "2-digit",
                  "20"
                ],
                tl: /* [] */0
              }
            }, (function (param) {
                return Jest.Expect.toEqual(param[1], Jest.Expect.expect(DateTime.make(undefined, "sv-SE", DateTime.Options.make(undefined, undefined, Caml_option.some(param[0]), undefined, undefined, undefined, undefined, undefined), undefined)));
              }));
        Jest.test("all options", (function (param) {
                return Jest.Expect.toEqual("onsdag 01 januari 2020 e.Kr.", Jest.Expect.expect(DateTime.make(undefined, "sv-SE", DateTime.Options.make("long", "long", "numeric", "2-digit", "narrow", undefined, undefined, undefined), undefined)));
              }));
        Jest.testAll("dateStyle", {
              hd: [
                "short",
                "2020-01-01"
              ],
              tl: {
                hd: [
                  "long",
                  "1 januari 2020"
                ],
                tl: {
                  hd: [
                    "medium",
                    "1 jan. 2020"
                  ],
                  tl: {
                    hd: [
                      "full",
                      "onsdag 1 januari 2020"
                    ],
                    tl: /* [] */0
                  }
                }
              }
            }, (function (param) {
                return Jest.Expect.toEqual(param[1], Jest.Expect.expect(DateTime.make(undefined, "sv-SE", DateTime.Options.make(undefined, undefined, undefined, undefined, undefined, Caml_option.some(param[0]), undefined, undefined), undefined)));
              }));
        return Jest.testAll("timeStyle", {
                    hd: [
                      "short",
                      "14:00"
                    ],
                    tl: {
                      hd: [
                        "long",
                        "14:00:00 CET"
                      ],
                      tl: {
                        hd: [
                          "medium",
                          "14:00:00"
                        ],
                        tl: {
                          hd: [
                            "full",
                            "14:00:00 centraleuropeisk normaltid"
                          ],
                          tl: /* [] */0
                        }
                      }
                    }
                  }, (function (param) {
                      return Jest.Expect.toEqual(param[1], Jest.Expect.expect(DateTime.make(undefined, "sv-SE", DateTime.Options.make(undefined, undefined, undefined, undefined, undefined, undefined, Caml_option.some(param[0]), undefined), undefined)));
                    }));
      }));

exports.today = today;
exports.date = date;
exports.futureDate = futureDate;
/*  Not a pure module */
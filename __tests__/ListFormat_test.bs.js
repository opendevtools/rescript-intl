// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var Jest = require("@glennsl/bs-jest/lib/js/src/jest.bs.js");
var ListFormat = require("../src/ListFormat.bs.js");
var Caml_option = require("rescript/lib/js/caml_option.js");

Jest.test("handles default formatting", (function (param) {
        return Jest.Expect.toEqual("Cat, Tiger, and Lion", Jest.Expect.expect(ListFormat.make([
                            "Cat",
                            "Tiger",
                            "Lion"
                          ], undefined, undefined, undefined)));
      }));

Jest.test("handles conjunctions", (function (param) {
        return Jest.Expect.toEqual("Cat, Tiger, and Lion", Jest.Expect.expect(ListFormat.make([
                            "Cat",
                            "Tiger",
                            "Lion"
                          ], undefined, ListFormat.Options.make(undefined, "conjunction", undefined), undefined)));
      }));

Jest.test("handles disjunctions", (function (param) {
        return Jest.Expect.toEqual("Cat, Tiger, or Lion", Jest.Expect.expect(ListFormat.make([
                            "Cat",
                            "Tiger",
                            "Lion"
                          ], undefined, ListFormat.Options.make(undefined, "disjunction", undefined), undefined)));
      }));

Jest.test("handles units", (function (param) {
        return Jest.Expect.toEqual("Cat, Tiger, Lion", Jest.Expect.expect(ListFormat.make([
                            "Cat",
                            "Tiger",
                            "Lion"
                          ], undefined, ListFormat.Options.make(undefined, "unit", undefined), undefined)));
      }));

Jest.test("handles short format", (function (param) {
        return Jest.Expect.toEqual("Cat, Tiger, Lion", Jest.Expect.expect(ListFormat.make([
                            "Cat",
                            "Tiger",
                            "Lion"
                          ], undefined, ListFormat.Options.make("short", "unit", undefined), undefined)));
      }));

Jest.test("handles narrow format", (function (param) {
        return Jest.Expect.toEqual("Cat Tiger Lion", Jest.Expect.expect(ListFormat.make([
                            "Cat",
                            "Tiger",
                            "Lion"
                          ], undefined, ListFormat.Options.make("narrow", "unit", undefined), undefined)));
      }));

var cats = [
  "Cat",
  "Tiger",
  "Lion"
];

var expectedShort = "Cat, Tiger, Lion";

var expectedNarrow = "Cat Tiger Lion";

Jest.testAll("handles invalid style/type pairs", {
      hd: [
        "conjunction",
        "narrow",
        expectedNarrow
      ],
      tl: {
        hd: [
          "conjunction",
          "short",
          expectedShort
        ],
        tl: {
          hd: [
            "disjunction",
            "narrow",
            expectedNarrow
          ],
          tl: {
            hd: [
              "disjunction",
              "short",
              expectedShort
            ],
            tl: /* [] */0
          }
        }
      }
    }, (function (param) {
        return Jest.Expect.toEqual(param[2], Jest.Expect.expect(ListFormat.make(cats, undefined, ListFormat.Options.make(Caml_option.some(param[1]), Caml_option.some(param[0]), undefined), undefined)));
      }));

exports.cats = cats;
exports.expectedShort = expectedShort;
exports.expectedNarrow = expectedNarrow;
/*  Not a pure module */
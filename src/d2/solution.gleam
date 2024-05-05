import gleam/int
import gleam/list
import gleam/string

pub fn solve(input: String, variant: String) -> Int {
  string.split(string.trim(input), "\n")
  |> list.fold(0, fn(acc, x) {
    case string.split(x, " ") {
      [rules, needle, haystack] -> {
        let #(min, max) = case
          list.filter_map(string.split(rules, "-"), int.parse)
        {
          [a, b] -> #(a, b)
          _ -> #(0, 0)
        }

        let selector = case string.split(needle, ":") {
          [sel, _] -> sel
          _ -> ""
        }

        string.split(haystack, "")
        |> list.index_fold(0, fn(acc, x, i) {
          case variant {
            "b" ->
              case i + 1 == min || i + 1 == max {
                True if x == selector -> acc + 1
                _ -> acc
              }
            _ ->
              case x == selector {
                True -> acc + 1
                _ -> acc
              }
          }
        })
        |> fn(x) {
          case variant {
            "b" ->
              case x == 1 {
                True -> acc + 1
                _ -> acc
              }
            _ ->
              case x >= min && x <= max {
                True -> acc + 1
                _ -> acc
              }
          }
        }
      }
      _ -> acc
    }
  })
}

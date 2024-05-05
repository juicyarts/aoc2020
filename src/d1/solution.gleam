import gleam/int
import gleam/list
import gleam/string

pub fn solve(input: String, target: Int, depth: Int) -> Int {
  let nums =
    string.split(string.trim(input), "\n")
    |> list.filter_map(int.parse)

  nums
  |> list.index_fold(0, fn(s1, x, i) {
    list.index_fold(nums, s1, fn(s2, y, j) {
      case depth {
        1 ->
          case i == j {
            False ->
              case x + y {
                result if result == target -> x * y
                _ -> s2
              }
            _ -> s2
          }
        2 ->
          list.index_fold(nums, s2, fn(s3, z, k) {
            case j == k {
              False ->
                case x + y + z {
                  result if result == target -> x * y * z
                  _ -> s3
                }
              _ -> s3
            }
          })
        _ -> s1
      }
    })
  })
}

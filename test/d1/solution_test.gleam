import d1/solution
import gleam/erlang/os
import gleam/int
import showtime/tests/should
import simplifile.{read}

const static_test_input = "1721
979
366
299
675
1456"

pub fn part1_p1_test() {
  let test_result = 514_579
  solution.solve(static_test_input, 2020, 1)
  |> should.equal(test_result)
}

pub fn part1_p2_test() {
  let assert Ok(res) = os.get_env("D1_P1")
  let assert Ok(test_result) = int.parse(res)
  let assert Ok(test_input) = read("./test/d1/i.txt")

  solution.solve(test_input, 2020, 1)
  |> should.equal(test_result)
}

pub fn part2_p1_test() {
  let test_result = 241_861_950
  solution.solve(static_test_input, 2020, 2)
  |> should.equal(test_result)
}

pub fn part2_p2_test() {
  let assert Ok(res) = os.get_env("D1_P2")
  let assert Ok(test_result) = int.parse(res)
  let assert Ok(test_input) = read("./test/d1/i.txt")

  solution.solve(test_input, 2020, 2)
  |> should.equal(test_result)
}

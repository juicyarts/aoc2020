import d2/solution
import gleam/erlang/os
import gleam/int
import showtime/tests/should
import simplifile.{read}

const static_test_input = "1-3 a: abcde
1-3 b: cdefg
2-9 c: ccccccccc"

pub fn part1_p1_test() {
  let test_result = 2

  solution.solve(static_test_input, "a")
  |> should.equal(test_result)
}

pub fn part1_p2_test() {
  let assert Ok(res) = os.get_env("D2_P1")
  let assert Ok(test_result) = int.parse(res)
  let assert Ok(test_input) = read("./test/d2/i.txt")

  solution.solve(test_input, "a")
  |> should.equal(test_result)
}

pub fn part2_p1_test() {
  let test_result = 1

  solution.solve(static_test_input, "b")
  |> should.equal(test_result)
}

pub fn part2_p2_test() {
  let assert Ok(res) = os.get_env("D2_P2")
  let assert Ok(test_result) = int.parse(res)
  let assert Ok(test_input) = read("./test/d2/i.txt")

  solution.solve(test_input, "b")
  |> should.equal(test_result)
}

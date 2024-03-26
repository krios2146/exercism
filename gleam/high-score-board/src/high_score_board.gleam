import gleam/dict.{type Dict}
import gleam/option.{type Option}
import gleam/list

pub type ScoreBoard =
  Dict(String, Int)

pub fn create_score_board() -> ScoreBoard {
  dict.from_list([#("The Best Ever", 1_000_000)])
}

pub fn add_player(
  score_board: ScoreBoard,
  player: String,
  score: Int,
) -> ScoreBoard {
  score_board
  |> dict.insert(player, score)
}

pub fn remove_player(score_board: ScoreBoard, player: String) -> ScoreBoard {
  score_board
  |> dict.delete(player)
}

pub fn update_score(
  score_board: ScoreBoard,
  player: String,
  points: Int,
) -> ScoreBoard {
  case dict.has_key(score_board, player) {
    True -> dict.update(score_board, player, add_to_option(points))
    False -> score_board
  }
}

pub fn apply_monday_bonus(score_board: ScoreBoard) -> ScoreBoard {
  score_board
  |> dict.to_list
  |> list.map(add_to_pair(100))
  |> dict.from_list
}

fn add_to_option(a: Int) -> fn(Option(Int)) -> Int {
  fn(b: Option(Int)) -> Int {
    b
    |> option.unwrap(or: 0)
    |> add(a)
  }
}

fn add_to_pair(a: Int) -> fn(#(String, Int)) -> #(String, Int) {
  fn(b: #(String, Int)) -> #(String, Int) { #(b.0, add(a, b.1)) }
}

fn add(a: Int, b: Int) -> Int {
  a + b
}

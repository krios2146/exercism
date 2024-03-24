import gleam/list
import gleam/result

pub fn today(days: List(Int)) -> Int {
  days
  |> list.first
  |> result.unwrap(or: 0)
}

pub fn increment_day_count(days: List(Int)) -> List(Int) {
  case days {
    [today, ..rest] -> [today + 1, ..rest]
    [] -> [1]
  }
}

pub fn has_day_without_birds(days: List(Int)) -> Bool {
  days
  |> list.any(fn(x) { x == 0 })
}

pub fn total(days: List(Int)) -> Int {
  days
  |> list.reduce(fn(x, y) { x + y })
  |> result.unwrap(or: 0)
}

pub fn busy_days(days: List(Int)) -> Int {
  days
  |> list.filter(fn(x) { x >= 5 })
  |> list.length
}

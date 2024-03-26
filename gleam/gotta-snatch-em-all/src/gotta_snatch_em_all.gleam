import gleam/set.{type Set}
import gleam/list
import gleam/result
import gleam/string

pub fn new_collection(card: String) -> Set(String) {
  set.from_list([card])
}

pub fn add_card(collection: Set(String), card: String) -> #(Bool, Set(String)) {
  #(set.contains(collection, card), set.insert(collection, card))
}

pub fn trade_card(
  my_card: String,
  their_card: String,
  collection: Set(String),
) -> #(Bool, Set(String)) {
  let is_trade_possible = set.contains(collection, my_card)
  let is_worth_trading = !set.contains(collection, their_card)

  let collection =
    collection
    |> set.delete(my_card)
    |> set.insert(their_card)

  #(is_trade_possible && is_worth_trading, collection)
}

pub fn boring_cards(collections: List(Set(String))) -> List(String) {
  collections
  |> list.reduce(set.intersection)
  |> result.map(set.to_list)
  |> result.unwrap(or: [])
}

pub fn total_cards(collections: List(Set(String))) -> Int {
  collections
  |> list.reduce(set.union)
  |> result.map(set.size)
  |> result.unwrap(or: 0)
}

pub fn shiny_cards(collection: Set(String)) -> Set(String) {
  collection
  |> set.filter(string.starts_with(_, "Shiny ")
}

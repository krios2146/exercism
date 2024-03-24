import gleam/list

pub type Pizza {
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}

pub fn pizza_price(pizza: Pizza) -> Int {
  case pizza {
    Margherita -> 7
    Caprese -> 9
    Formaggio -> 10
    ExtraSauce(pizza) -> pizza_price(pizza) + 1
    ExtraToppings(pizza) -> pizza_price(pizza) + 2
  }
}

pub fn order_price(order: List(Pizza)) -> Int {
  let extra_fee = case list.length(order) {
    1 -> 3
    2 -> 2
    _ -> 0
  }
  order_price_extra_fee(order, extra_fee)
}

fn order_price_extra_fee(order: List(Pizza), accumulator: Int) -> Int {
  case order {
    [] -> accumulator
    [pizza, ..rest] ->
      order_price_extra_fee(rest, accumulator + pizza_price(pizza))
  }
}

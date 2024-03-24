import gleam/list

pub type Pizza {
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}

pub fn pizza_price(pizza: Pizza) -> Int {
  pizza_price_with_tail(pizza, 0)
}

fn pizza_price_with_tail(pizza: Pizza, accumulator: Int) -> Int {
  case pizza {
    Margherita -> accumulator + 7
    Caprese -> accumulator + 9
    Formaggio -> accumulator + 10
    ExtraSauce(pizza) -> pizza_price_with_tail(pizza, accumulator + 1)
    ExtraToppings(pizza) -> pizza_price_with_tail(pizza, accumulator + 2)
  }
}

pub fn order_price(order: List(Pizza)) -> Int {
  let order_price = order_price_with_tail(order, 0)

  let extra_fee = case list.length(order) {
    1 -> 3
    2 -> 2
    _ -> 0
  }

  order_price + extra_fee
}

fn order_price_with_tail(order: List(Pizza), accumulator: Int) -> Int {
  case order {
    [] -> accumulator
    [pizza, ..rest] ->
      order_price_with_tail(rest, accumulator + pizza_price(pizza))
  }
}

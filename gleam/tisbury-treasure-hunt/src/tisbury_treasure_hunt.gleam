import gleam/list

pub fn place_location_to_treasure_location(
  place_location: #(String, Int),
) -> #(Int, String) {
  case place_location {
    #(place, location) -> #(location, place)
  }
}

pub fn treasure_location_matches_place_location(
  place_location: #(String, Int),
  treasure_location: #(Int, String),
) -> Bool {
  place_location_to_treasure_location(place_location) == treasure_location
}

pub fn count_place_treasures(
  place: #(String, #(String, Int)),
  treasures: List(#(String, #(Int, String))),
) -> Int {
  let place_location = place.1

  list.map(treasures, fn(x) { x.1 })
  |> list.filter(fn(x) {
    treasure_location_matches_place_location(place_location, x)
  })
  |> list.length()
}

pub fn special_case_swap_possible(
  found_treasure: #(String, #(Int, String)),
  place: #(String, #(String, Int)),
  desired_treasure: #(String, #(Int, String)),
) -> Bool {
  case found_treasure, place, desired_treasure {
    #("Brass Spyglass", _), #("Abandoned Lighthouse", _), _ -> True
    #("Amethyst Octopus", _), #("Stormy Breakwater", _), #("Crystal Crab", _) ->
      True
    #("Amethyst Octopus", _), #("Stormy Breakwater", _), #("Glass Starfish", _) ->
      True
    #("Vintage Pirate Hat", _), #("Harbor Managers Office", _), #(
      "Model Ship in Large Bottle",
      _,
    ) -> True
    #("Vintage Pirate Hat", _), #("Harbor Managers Office", _), #(
      "Antique Glass Fishnet Float",
      _,
    ) -> True
    _, _, _ -> False
  }
}

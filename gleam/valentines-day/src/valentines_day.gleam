pub type Approval {
  Yes
  No
  Maybe
}

pub type Cuisin {
  Korean
  Turkish
}

pub type Genre {
  Crime
  Horror
  Romance
  Thriller
}

pub type Activity {
  BoardGame
  Chill
  Movie(Genre)
  Restaurant(Cuisin)
  Walk(Int)
}

pub fn rate_activity(activity: Activity) -> Approval {
  case activity {
    Movie(Romance) -> Yes
    Restaurant(Korean) -> Yes
    Restaurant(Turkish) -> Maybe
    Walk(x) if x > 11 -> Yes
    Walk(x) if x > 6 -> Maybe
    _ -> No
  }
}

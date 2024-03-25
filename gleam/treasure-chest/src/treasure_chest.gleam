pub type TreasureChest(t) {
  TreasureChest(password: String, treasure: t)
}

pub type UnlockResult(t) {
  Unlocked(t)
  WrongPassword
}

pub fn get_treasure(
  chest: TreasureChest(treasure),
  password: String,
) -> UnlockResult(treasure) {
  case chest.password == password {
    True -> Unlocked(chest.treasure)
    False -> WrongPassword
  }
}

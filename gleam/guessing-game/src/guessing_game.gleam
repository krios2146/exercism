pub fn reply(guess: Int) -> String {
  case guess {
    too_low if too_low < 41 -> "Too low"
    41 -> "So close"
    42 -> "Correct"
    43 -> "So close"
    _ -> "Too high"
  }
}

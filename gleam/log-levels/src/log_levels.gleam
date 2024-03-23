import gleam/string

pub fn message(log_line: String) -> String {
  case log_line {
    "[INFO]:" <> message -> string.trim(message)
    "[WARNING]:" <> message -> string.trim(message)
    "[ERROR]:" <> message -> string.trim(message)
    _ -> log_line
  }
}

pub fn log_level(log_line: String) -> String {
  let message_length = string.length(message(log_line))

  string.trim_right(log_line)
  |> string.drop_right(message_length)
  |> string.trim_right()
  |> string.drop_right(2)
  |> string.drop_left(1)
  |> string.lowercase()
}

pub fn reformat(log_line: String) -> String {
  message(log_line) <> " (" <> log_level(log_line) <> ")"
}

import gleam/string
import gleam/result

pub fn first_letter(name: String) {
  name
  |> string.trim
  |> string.first
  |> result.unwrap(or: "")
}

pub fn initial(name: String) {
  name
  |> first_letter
  |> string.uppercase
  |> string.append(".")
}

pub fn initials(full_name: String) {
  case string.split(full_name, on: " ") {
    [first, last] -> string.append(initial(first) <> " ", initial(last))
    _ -> full_name
  }
}

pub fn pair(full_name1: String, full_name2: String) {
  let first = initials(full_name1)
  let second = initials(full_name2)

  "
     ******       ******
   **      **   **      **
 **         ** **         **
**            *            **
**                         **
**     " <> first <> "  +  " <> second <> "     **
 **                       **
   **                   **
     **               **
       **           **
         **       **
           **   **
             ***
              *
"
}

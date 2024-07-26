import argv
import gleam/regex

pub fn main() {
  let args = argv.load().arguments

  case args {
    [command, ..] -> {
      case is_valid_command(command) {
        True -> todo as "Not implemented"
        False -> panic as "Command must only be a list of L, R, or F"
      }
    }
    _ -> panic as "Usage: ./program <command>"
  }
}

fn is_valid_command(command: String) -> Bool {
  let regex = case regex.from_string("^[LRF]+$") {
    Ok(re) -> re
    Error(_) -> panic as "Invalid regex"
  }

  regex.check(content: command, with: regex)
}

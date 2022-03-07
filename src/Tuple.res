@val
@scope("Array")
@ocaml.doc(`Create a new tuple by providing the values separately. Useful for currying.`)
external make: ('a, 'b) => ('a, 'b) = "of"

@send
@ocaml.doc(`Given a function that takes two arguments, apply that function to the two values contained in a tuple.`)
external apply: (('a, 'b) => 'c, @as(json`null`) _, ('a, 'b)) => 'c = "apply"

@send @ocaml.doc(`Convert the given tuple to an array.`)
external toArray: (('a, 'a)) => array<'a> = "slice"

@get @ocaml.doc(`Extract the first value from a tuple.`)
external first: (('a, 'b)) => 'a = "0"

@get @ocaml.doc(`Extract the second value from a tuple.`)
external second: (('a, 'b)) => 'b = "1"

@send @ocaml.doc(`Transform each value in a tuple.`)
external map: (('a, 'a), 'a => 'b) => ('b, 'b) = "map"

@send @ocaml.doc(`Join together two strings in a tuple with a given separator.`)
external join: ((string, string), string) => string = "join"

@ocaml.doc(`Transform the first value in a tuple.`)
let mapFirst = (couple, project) => (couple->first->project, couple->second)

@ocaml.doc(`Transform the second value in a tuple.`)
let mapSecond = (couple, project) => (couple->first, couple->second->project)

@ocaml.doc(`Flip the two values in a tuple.`)
let flip = couple => (couple->second, couple->first)

@ocaml.doc(`Transpose a tuple of options to an option of tuple.`)
let transpose = couple =>
  switch couple {
  | (Some(first), Some(second)) => Some(first, second)
  | _ => None
  }

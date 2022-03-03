type t<'a, 'b> = ('a, 'b)

@send
external apply: (('a, 'b) => 'c, @as(json`null`) _, t<'a, 'b>) => 'c = "apply"

@val @scope("Array") external make: ('a, 'b) => t<'a, 'b> = "of"
external toArray: t<'a, 'a> => array<'a> = "%identity"
@get external first: t<'a, 'b> => 'a = "0"
@get external second: t<'a, 'b> => 'b = "1"
@send external map: (t<'a, 'a>, 'a => 'b) => t<'b, 'b> = "map"
@send external mapWithIndex: (t<'a, 'a>, ('a, int) => 'b) => t<'b, 'b> = "map"
@send external append: (t<'a, 'b>, 'c) => ('a, 'b, 'c) = "concat"
let mapFirst = (couple, project) => (couple->first->project, couple->second)
let mapSecond = (couple, project) => (couple->first, couple->second->project)
let flip = couple => (couple->second, couple->first)
let transpose = couple =>
  switch couple {
  | (Some(first), Some(second)) => Some(first, second)
  | _ => None
  }

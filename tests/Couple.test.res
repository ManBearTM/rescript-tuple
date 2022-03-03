open Test

@get external unsafe_length: 'a => int = "length"

let tripleEquals = assertion((a, b) => {
  let (a_first, a_second, a_third) = a
  let (b_first, b_second, b_third) = b
  a_first == b_first &&
  a_second == b_second &&
  a_third == b_third &&
  a->unsafe_length == b->unsafe_length
})

test("append", () => {
  let couple = (false, 1)
  let triple = couple->Couple.append("2")
  tripleEquals(triple, (false, 1, "2"))
})

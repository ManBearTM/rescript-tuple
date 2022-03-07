open Test

// Use default deep equality for everything
let equals = (a, b) => assertion((a, b) => a == b, a, b)

test("make", () => {
  let curried = Tuple.make(1)
  let pair = curried("2")
  (1, "2")->equals(pair)
})

test("make with array", () => {
  let pair = Tuple.make([1, 2, 3], "4")
  ([1, 2, 3], "4")->equals(pair)
})

test("apply", () => {
  let pair = ("1", false)
  let function = (a, b) => (a, b)->equals(pair)
  function->Tuple.apply(pair)
})

test("toArray", () => {
  let pair = (true, false)
  pair->Tuple.toArray->equals([true, false])
})

test("toArray with mutation", () => {
  let pair = (-1, 0)
  let array = pair->Tuple.toArray
  array->Js.Array2.reverseInPlace->equals([0, -1])
  (-1, 0)->equals(pair)
})

test("first", () => {
  let pair = (0, "1")
  pair->Tuple.first->equals(0)
})

test("second", () => {
  let pair = ("0", true)
  pair->Tuple.second->equals(true)
})

test("map", () => {
  let pair = (1, 2)->Tuple.map(x => x + 1)
  (2, 3)->equals(pair)
})

test("join", () => {
  let pair = ("hi", "there")->Tuple.join(" ")
  pair->equals("hi there")
})

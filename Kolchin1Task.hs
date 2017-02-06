v1 = (( 1, "a"), "abc")
snd (fst v1)

v21 = ["a", "b", "c"]
head (tail v21)

v22 = [["a", "b"], ["c","d"]]
tail(head v22)

v23 = [["a", "c", "d"], ["a","b"]]
tail(head (tail v23))

v24 = [["a","d"], ["b", "c"]]
head (head (tail v24))

v31 = [x*2 + 1 | x <- [0..19]]
v32 = [ x | x <- [1..40], x `mod` 2 == 1]
v33 = [ x | x <- [1..40], odd x ]

v41 = [0.5 * x * (x + 1) | x <- [0..49]]

v51 = [0.5 * x * (3 * x - 1) | x <- [1..50]]


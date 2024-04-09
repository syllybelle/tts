---- table indexing ref:
t = {}
t.foo = 123 -- same as t["foo"] (but not t[foo], which would use the variable foo as the key)
print(t.foo) -- 123
print(t["foo"]) -- 123

t = {foo = "bar"} -- same as ["foo"]="bar" (but not [foo]="bar" , that would use the variable foo)
print(t["foo"]) -- bar

t = {["foo"] = "bar"}
print(t.foo) -- bar

print(t["foo"])

foo = 'baz'

t[foo] = "bat"
print(t[foo]) -- bat
print(t["foo"]) -- bar
print(t.foo) -- bar
print(t.baz) -- bat

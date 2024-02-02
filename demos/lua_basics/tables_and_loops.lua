grades = {"firstie", "second class", "youngster", "plebe"}

for i=1,#grades do
  print("Grade is ", grades[i])
end

table.insert(grades, "graduate")

print("")
for i=1,#grades do
  print("Grade is ", grades[i])
end

-- call with `lua tables_and_loops.lua`
-- can use tables as dictionaries for object oriented stuff 
-- because love won't run anything unless it's in a doc titled "main.lua"
-- this allows us to split up our code like in demo7

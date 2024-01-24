grades = {"firstie", "second class", "youngster", "plebe"}

for i=1,#grades do
  print("Grade is ", grades[i])
end

table.insert(grades, "graduate")

print("")
for i=1,#grades do
  print("Grade is ", grades[i])
end


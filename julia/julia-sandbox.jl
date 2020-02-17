using Printf
using Statistics
# Importing modules

#Variables can be used by numbers, underscores, exclaimations or alphabets
s = 090
#Variables are dynamically assigned
s = "Cat"
println(s)

#Assert Data Types
function changeTypes()
    x::Int8 = 100
    #x = "Meow"
end

println(changeTypes())

#booleans either true or false
hasFur = true 

#Int8: -128 ~ 127
#Int16: -32,768 ~ 32,767
#Int32: -2,147,483,648 ~ 2,147,483,647
#Int64: -2^63 ~ 2^63 - 1
#Float32, Float64, UInt8, UInt16, ...
#Big Float, Big Int

c1 = 'A'
c2 = Char(120)
println(c2)

il = UInt8(trunc(3.14))
println(il)

f1 = parse(Float64, "1")
println(f1)

i2 = parse(Int8, "1")
println(i2)

##Strings

s1 = "This is a string\n"
println(length(s1))
println(s1[1])
println(s1[end])
println(s1[1:4])

s2 = string("Cat","Man")
println(s2)
println("Pinguin"*" Time")
i3 = 2
i4 = 3
println("$i3 + $i4 = $(i3 + i4)")

s3 = """
Type
here
for
many
lines
"""

println("Dog" > "Cat")
println(findfirst(isequal('C'), "Catwoman"))
println(occursin("at","batman"))

##Conditions
# > < >= <= == !=
# && || !

age = 12
if age >=5 && age <= 6
    println("You're a baby")
elseif age >= 7 && age <= 13
    println("Junior??")
elseif age >= 14 && age <= 18
    println("Go back to school")
else
    println("School ain't for you")
end

@printf("true || false = %s\n", true || false ? "true" : "false")
@printf("!true = %s\n", !true ? "true" : "false")

##LOOPING
#While Loop
i = 1
while i < 20
    if (i % 2) == 0
        println(i)
        #global value outside of code blocks
        global i += 1
        continue
    end
    global i += 1
    if i >= 10
        break
    end
end

#For Loop
for i = 1:5
    println(i)
end

for i in [2,4,6]
    println(i)
end

for i = 1:5, j = 2:2:10
    println((i,j))
end

#Looping arrays
a1 = zeros(Int32, 2, 2)

a2 = Array{Int32}(undef, 5) #5 Undefined values

a3 = Float64[]

a4 = [1,2,3]
println(a4[1])
println(a4[end])
println(5 in a4)
println(findfirst(isequal(2), a4))
f(a) = (a >= 2) ? true : false
println(findall(f, a4))
println(count(f, a4))

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

#Int8: -128, 127
#Int16: -32 768, 32 767
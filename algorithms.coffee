# Generate a random integer between min and max (inclusive)
randInt = (min, max) ->
    Math.round(Math.random() * (max - min)) + min

# Shuffle an array using Fisher-Yates
shuffle = (list) ->
    (do (i) -> 
        rand = randInt(i, list.length - 1)
        [list[i], list[rand]] = [list[rand], list[i]]
    ) for i in [0...list.length - 1]
    list

# Simple quicksort
quicksort = (list) ->
    if list.length > 1
        pivot = list.pop()
        quicksort(i for i in list when i <= pivot)
        .concat [pivot]
        .concat quicksort(i for i in list when i > pivot)
    else
        list

# My favorite sorting algorithm ever
trollsort = (list, callback) ->
    result = []
    (do (num) ->
        setTimeout (-> 
            result.push num
            if (result.length == list.length)
                callback(result)
        ), num
    ) for num in list

# Take a function that returns some value, make it call a callback instead
makeAsync = (func) ->
    (args..., callback) ->
        callback func args...

# Make an async version of quicksort
quicksortAsync = makeAsync quicksort

arr = shuffle [0..9]
console.log arr
quicksortAsync arr, console.log
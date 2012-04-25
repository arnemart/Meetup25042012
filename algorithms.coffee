l = console.log

# Generate a random integer between min and max (inclusive)
randInt = (min, max) ->
    Math.round(Math.random() * (max - min)) + min

# Shuffle an array using Fisher-Yates
shuffle = (list) ->
    for i in [0...list.length - 1]
        rand = randInt(i, list.length - 1)
        [list[i], list[rand]] = [list[rand], list[i]]
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
        setTimeout -> 
            result.push num
            if (result.length == list.length)
                callback(result)
        , num
    ) for num in list

# Take a function that returns some value, make it call a callback instead (Continuation Passing Style)
makeCPS = (func) ->
    (args..., callback) ->
        callback func args...

# Make an async version of quicksort
quicksortAsync = makeCPS quicksort

# Shuffle some numbers
l shuffled = shuffle [0..20]

# Sort the numbers with trollsort
trollsort shuffled, l


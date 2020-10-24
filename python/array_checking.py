def checkSameArray(arr, arr2):
    #If the shape/size of array is not the same, return false
    if len(arr)!= len(arr2):
        return False
    else:
        #Loop for each object in array
        for index, value in enumerate (arr):
            if arr[index]!=arr2[index]:
                return False
        return True
    
array1 = [1,2,3,4]
array2 = [1,2,3,5]
array3 = [1,2,3,4]

print(checkSameArray(array1,array2))
print(checkSameArray(array1,array3))
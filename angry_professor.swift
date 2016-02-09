import Foundation

func readData() -> NSData {
    return NSFileHandle.fileHandleWithStandardInput().availableData
}

func readString() -> String {
    return String(data: readData(), encoding:NSUTF8StringEncoding)!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
}

func processInput() -> [[Int]] {
    let input = readString()

    let array = input.componentsSeparatedByString("\n")
    var newArray = [[Int]]()
    for idx in array {
        let temp = idx.componentsSeparatedByString(" ")
        var intTemp = [Int]()
        for idx in temp {
            intTemp.append(Int(idx)!)
        }
        newArray.append(intTemp)

    }
    return newArray
}

func classCancellation() {
    var input = processInput()
    var test = 0
    var paramIdx = 1
    var dataIdx = 2

    while test < input[0][0] {
       let dataArr = input[dataIdx]
       let threshold = input[paramIdx][1]
       var onTimeCount = 0

       for student in dataArr {
        if student <= 0 {
            onTimeCount += 1
        }
       }
       if onTimeCount >= threshold {
        print("NO")
       } else {
        print("YES")
       }
       test += 1
       paramIdx += 2
       dataIdx += 2
    }
}

classCancellation()

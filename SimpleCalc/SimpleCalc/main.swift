//
//  main.swift
//  SimpleCalc
//
//  Created by Alex Schenck on 10/7/15.
//  Copyright (c) 2015 Alex Schenck. All rights reserved.
//  INFO 498
//

import Foundation

// Accepts string input from console
func input() -> String {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let result = NSString(data: inputData, encoding:NSUTF8StringEncoding) as! String
    
    return result.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
}

// Converts given String to Double and returns result
func convertToDouble(incoming:String) -> Double {
    return (incoming as NSString).doubleValue
}

// Splits given String by spaces into an Array
func splitBySpaces(incoming:String) -> [String] {
    return incoming.componentsSeparatedByString(" ")
}

// Returns factorial of given Int
func factorial(incoming:Double) -> Double {
    if incoming < 2 {
        return 1
    }
    else {
        return incoming * factorial(incoming - 1)
    }
}

println("Welcome to Alex Schenck's SimpleCalc! Now ready for input.")

// First line entered by user split into an array by spaces
var userInput = splitBySpaces(input())

// There are multiple elements in the input, treat as multi-operand operation
if (userInput.count > 1) {
    let op = userInput[userInput.count - 1]
    
    switch op {
        case "count":
            // Count operation, return array size minus operator descriptor
            println(userInput.count - 1)
        case "avg":
            // Average operation, add all numbers, divide by array size minus operator descriptor
            let numberCount = userInput.count - 1
            var result : Double = 0
            var temp : Double = 0
            for var index = 0; index < numberCount; index++ {
                temp = convertToDouble(userInput[index])
                result += temp
            }

            result = result / Double(numberCount)
            println(result)
        case "fact":
            // Factorial operation, print error if given more than one number, otherwise return factorial
            if (userInput.count > 2) {
                println("Factorial operation only accepts one number")
            }
            else {
                println(factorial(convertToDouble(userInput[0])))
            }
        default:
            // Operation given in incorrect format or unrecognized operator
            println("Not an accepted operator!")
    }
}
else {
    // Only one element in first input, treat as simple multi-line calculation
    
    // Gather variables and convert to double
    let first = convertToDouble(userInput[0])
    
    // Operator
    println("Enter desired operation")
    let op = input()
    
    // Second number
    println("Enter second number")
    let second = convertToDouble(input())
    
    println("Result:")
    
    var r: Double
    
    // Print result based on operator
    switch op {
        case "+":
            r = first + second
            println(r)
        case "-":
            r = first - second
            println(r)
        case "*":
            r = first * second
            println(r)
        case "/":
            r = first / second
            println(r)
        case "%":
            r = first % second
            println(r)
        default:
            // Operator not recognized
            println("Not an accepted operator!")
    }
}

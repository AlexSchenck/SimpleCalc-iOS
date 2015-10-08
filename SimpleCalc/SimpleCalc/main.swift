//
//  main.swift
//  SimpleCalc
//
//  Created by Alex Schenck on 10/7/15.
//  Copyright (c) 2015 Alex Schenck. All rights reserved.
//

import Foundation

// Accepts string input from console
func input() -> String {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let result = NSString(data: inputData, encoding:NSUTF8StringEncoding) as! String
    
    return result.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
}


// Converts given String to Int and returns result
func convertToInt(incoming:String) -> Int {
    return (incoming as NSString).integerValue
}

func convertToDouble(incoming:String) -> Double {
    return (incoming as NSString).doubleValue
}

// Splits given String by spaces into an Array
func splitBySpaces(incoming:String) -> [String]
{
    return incoming.componentsSeparatedByString(" ")
}

println("Welcome to Alex Schenck's SimpleCalc! Enter your operation now.")

// First line entered by user split into an array by spaces
var firstUserInput = splitBySpaces(input())

// There are multiple elements in the input, treat as multi-operand operation
if (firstUserInput.count > 1) {
    
}
else {
    // Only one element in first input, treat as simple multi-line calculation
    
    // Gather variables and convert to double
    let first = convertToDouble(firstUserInput[0])
    
    println("Enter desired operation")
    let op = input()
    
    println("Enter second number")
    let second = convertToDouble(input())
    
    println("Result:")
    
    var r: Double
    
    // Print result based on operator
    switch op {
        case "+":
            r = first + second
            println(r);
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
            println("Not an accepted operator!")
    }
}

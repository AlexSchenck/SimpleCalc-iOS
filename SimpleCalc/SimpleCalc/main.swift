//
//  main.swift
//  SimpleCalc
//
//  Created by iGuest on 10/7/15.
//  Copyright (c) 2015 Alex Schenck. All rights reserved.
//

import Foundation

func input() -> String
{
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let result = NSString(data: inputData, encoding:NSUTF8StringEncoding) as! String
    
    return result.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
}

println("Welcome to Alex Schenck's SimpleCalc! Enter your operation now.")
let firstInput = input()
println(firstInput)

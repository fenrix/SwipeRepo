//
//  UserData.swift
//  SwipeRepo
//
//  Created by Fenrir on 7/9/2559 BE.
//  Copyright © 2559 Fenrir. All rights reserved.
//
import Foundation
class UserData {
    
    static let sharedInstance = UserData();
    
    var testNum = 0
    let ns: NSMutableArray = []
    
    
    func addTestNum(param: Int) -> Int {
        
        return testNum + param
    }
    
    
}








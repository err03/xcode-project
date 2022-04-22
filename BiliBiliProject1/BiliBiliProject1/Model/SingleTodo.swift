//
//  SingleTodo.swift
//  BiliBiliProject1
//
//  Created by error on 2022/4/21.
//

import Foundation

struct SingleToDo:Identifiable,Codable{//结构体
    var id:Int = 0
    
    var deleted = false
    var isFavorite:Bool = false
    
    var title:String = ""
    var dueDate:Date = Date()
    var isChecked:Bool = false
}

//
//  Computer.swift
//  Final
//
//  Created by error on 2020/11/25.
//

import Foundation
class Computer: Product,ObservableObject {
    let category = "Computer"
    @Published var list:[Product] = []
    
    override init(){
        super.init()
    }
    
//    override init(name: String, price: Double, image: String, qty: Int, description: String, rate: Int, category: String) {
//        super.init(name: name, price: price, image: image, qty: qty, description: description, rate: rate, category: category)
//    }
//    
//    func insert(_p:Product){
//        list.insert(_p, at: list.startIndex)
//    }
}

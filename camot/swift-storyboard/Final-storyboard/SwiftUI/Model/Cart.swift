//
//  Cart.swift
//  Final
//
//  Created by error on 2020/11/21.
//

import Foundation

class Cart:ObservableObject{
    @Published var list:[Product] = []
    
    
    init() {
        let p1 = Product(name: "oo", price: 43.2, image: "computer1", qty: 1,description: "Thermal compound is necessary to create a reliable transfer of heat from your computer's processor to its heatsink to keep your CPU from overheating. Arctic Silver 5 thermal compound does this with three unique shapes and sizes of pure silver particles to maximize particle-to-particle contact area and thermal transfer. It's optimized for use between modern high-power CPUs and high-performance heatsinks or water-cooling solutions. This 3.5-gram tube contains enough compound to cover at least 15 to 25 small CPU cores, or 6 to 10 large CPU cores, or 2 to 5 heat plates.",rate: 3,category: "mouse")

        add(product: p1)
    }
    
    //add
    func add(product:Product){
//        list.insert(product, at:list.startIndex)
        list.append(product)
        for a in list{
            print("cart swift - get qty:\(a.getQty())")
        }
        print("cart swfit - current lists:\(list.count)")
    }
    
    //remove
    func remove(at offsets:IndexSet){
        list.remove(atOffsets:offsets)
    }
    
    //remove all
    func removeAll(){
        list.removeAll()
    }
    
}

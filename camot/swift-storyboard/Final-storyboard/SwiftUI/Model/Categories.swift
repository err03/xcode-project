//
//  Categories.swift
//  Final
//
//  Created by error on 2020/11/22.
//

import Foundation

class Categories:ObservableObject{
    @Published var name:[String] = ["Computer","Mouse","Keyboard","Headset"]
    @Published var list = []
    @Published var computer:[Product] = []
    @Published var mouse:[Product] = []
    @Published var keyboard:[Product] = []
    @Published var headset:[Product] = []
    
//    var id = UUID()
    
    init(){
        if let path = Bundle.main.path(forResource: "products", ofType: "plist"){
            do{
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                
                let tempDict = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String:Any]
                
                //compouter dict
                let computer = tempDict["Computers"] as! Array<[String:Any]>
                for dict in computer{
                    let name = dict["name"]! as! String
                    let price = Double(dict["price"]! as! String)!
                    let image = dict["image"]! as! String
                    let qty = Int(dict["qty"]! as! String)!
                    let description = dict["description"]! as! String
                    let rate = Int(dict["rate"]! as! String)!
                    let category = dict["category"]! as! String
                    let p = Product(name: name, price: price, image: image, qty: qty, description: description, rate: rate, category: category)
                    add(product: p)
                }
                //keyboard dict
                let keyboard = tempDict["Keyboards"] as! Array<[String:Any]>
                for dict in keyboard{
                    let name = dict["name"]! as! String
                    let price = Double(dict["price"]! as! String)!
                    let image = dict["image"]! as! String
                    let qty = Int(dict["qty"]! as! String)!
                    let description = dict["description"]! as! String
                    let rate = Int(dict["rate"]! as! String)!
                    let category = dict["category"]! as! String
                    let p = Product(name: name, price: price, image: image, qty: qty, description: description, rate: rate, category: category)
                    add(product: p)
                }
                //headset dict
                let headset = tempDict["Headsets"] as! Array<[String:Any]>
                for dict in headset{
                    let name = dict["name"]! as! String
                    let price = Double(dict["price"]! as! String)!
                    let image = dict["image"]! as! String
                    let qty = Int(dict["qty"]! as! String)!
                    let description = dict["description"]! as! String
                    let rate = Int(dict["rate"]! as! String)!
                    let category = dict["category"]! as! String
                    let p = Product(name: name, price: price, image: image, qty: qty, description: description, rate: rate, category: category)
                    add(product: p)
                }
                //mouse dict
                let mouse = tempDict["Mouses"] as! Array<[String:Any]>
                for dict in mouse{
                    let name = dict["name"]! as! String
                    let price = Double(dict["price"]! as! String)!
                    let image = dict["image"]! as! String
                    let qty = Int(dict["qty"]! as! String)!
                    let description = dict["description"]! as! String
                    let rate = Int(dict["rate"]! as! String)!
                    let category = dict["category"]! as! String
                    let p = Product(name: name, price: price, image: image, qty: qty, description: description, rate: rate, category: category)
                    add(product: p)
                }
                
            }catch{
                print(error)
            }//do .. catch
        }//if let path
        
        list = [computer,mouse,keyboard,headset]
//        for a in list{
//            print("listssss\(a[])")
//        }
//
    }
    
    //add
    func add(product:Product){
        if(product.getCategory() == "computer"){
            computer.insert(product, at: computer.startIndex)
            print("computer +1")
        }else if(product.getCategory() == "mouse"){
            mouse.insert(product, at: mouse.startIndex)
            print("mouse +1")
        }else if(product.getCategory() == "keyboard"){
            keyboard.insert(product, at: keyboard.startIndex)
            print("keyboard +1")
        }else if(product.getCategory() == "headset"){
            headset.insert(product, at: headset.startIndex)
            print("headset +1")
        }
    }
}

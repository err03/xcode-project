//
//  Product.swift
//  Final
//
//  Created by error on 2020/11/21.
//

import Foundation

class Product:Identifiable{    
    private var name = ""
    private var price = 0.0
    private var image = ""
    private var qty = 0
    private var description = ""
    private var rate = 0
    private var category = ""
    
    var id = UUID()
    
    init(){
        
    }
    
    init(name:String,price:Double,image:String,qty:Int,description:String,rate:Int,category:String){
        setName(_name: name)
        setPrice(_price: price)
        setImage(_image: image)
        setQty(_qty: qty)
        setDescription(_description: description)
        setRate(_rate: rate)
        setCategory(_category: category)
    }
    
    // product name
    func getName() -> String{
        name
    }
    func setName(_name:String){
        self.name = _name
    }
    
    //price
    func getPrice() -> Double{
        price
    }
    func setPrice(_price:Double){
        self.price = _price
    }
    
    //image
    func getImage() -> String{
        image
    }
    func setImage(_image:String){
        self.image = _image
    }
    
    //qty
    func getQty() -> Int{
        qty
    }
    func setQty(_qty:Int){
        self.qty = _qty
    }
    
    //description
    func getDescription() -> String{
        description
    }
    func setDescription(_description:String){
        self.description = _description
    }
    
    //rate
    func getRate() -> Int{
        rate
    }
    func setRate(_rate:Int){
        self.rate = _rate
    }
    
    //category
    func getCategory() -> String{
        category
    }
    func setCategory(_category:String){
        self.category = _category
    }
}

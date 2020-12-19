//
//  CartVC.swift
//  Final-storyboard
//
//  Created by error on 2020/12/13.
//

import UIKit


class CartVC: UIViewController,UITableViewDataSource {

    var cart = Cart()
    var cartList:[Product] = []
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("cartvc load")
        print("Notification center load")
        NotificationCenter.default.addObserver(self, selector: #selector(addInCartNotification(_:)), name: Notification.Name("addInCart"), object: nil)
        print("Notification center load success")
    }
    
    @objc func addInCartNotification(_ no:Notification){
        print("addInCart Notification called")
        let product:Product = no.object as! Product
        print("addInCart() method call")
        addInCart(product)
        
    }
    
    func addInCart(_ product:Product){
        print("-carlist insert begin")
        cartList.insert(product, at: cartList.endIndex)
        print("cart count:\(cartList.count)")
        print("-carlist insert success")
        tableView.reloadData()
//        print(tableView.reloadData())
        print("-tableview reload data")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("number of section in row:\(cartList.count)")
        return cartList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell",for: indexPath) as! CartCell
//        let cartlist = cart.list[indexPath.row]
        let cartlist = cartList[indexPath.row]
        cell.prductImage.image = UIImage(named:cartlist.getImage())
        cell.name.text = cartlist.getName()
        cell.price.text = String(cartlist.getPrice())
        cell.qty.text = String(cartlist.getQty())
        
        tableView.rowHeight = 140
//        print("erloaddata:\(tableView.reloadData())")
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
}

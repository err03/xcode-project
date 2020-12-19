//
//  CartVC_1.swift
//  Final-storyboard
//
//  Created by error on 2020/12/14.
//

import UIKit

class CartVC_1: UITableViewController {
    var cart = Cart()
    var cartList:[Product] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("cartvc load")
        print("Notification center load")
        NotificationCenter.default.addObserver(self, selector: #selector(addInCartNotification(_:)), name: Notification.Name("addInCart"), object: nil)
        print("Notification center load success")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        cartList.insert(cart.list[0], at: cartList.startIndex)
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
        self.tableView.reloadData()
        print("-tableview reload data")
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("numberofrow in section:\(cartList.count)")
        return cartList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell",for: indexPath) as! CartCell
//        let cartlist = cart.list[indexPath.row]
        let cartlist = cartList[indexPath.row]
        cell.prductImage.image = UIImage(named:cartlist.getImage())
        cell.name.text = cartlist.getName()
        cell.price.text = String(cartlist.getPrice())
        cell.qty.text = String(cartlist.getQty())
        
        tableView.rowHeight = 140

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

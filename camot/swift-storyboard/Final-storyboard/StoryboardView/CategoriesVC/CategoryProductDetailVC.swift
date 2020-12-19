//
//  CategoryProductDetailVC.swift
//  Final-storyboard
//
//  Created by error on 2020/12/13.
//

import UIKit

class CategoryProductDetailVC: UIViewController {

    var product:Product!
    
//    let cart = Cart()
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productDesctription: UITextView!
    
    @IBAction func addToCart(_ sender: UIButton) {
        NotificationCenter.default.post(name:Notification.Name("addInCart"),object:product)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        productName!.text = product.getName()
        productDesctription!.text = product.getDescription()
        productImage.image = UIImage(named: product.getImage())
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

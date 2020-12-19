//
//  LoadingVC.swift
//  Final-storyboard
//
//  Created by error on 2020/12/14.
//

import UIKit

class LoadingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("loading screen...")
        ViewController().loadViewIfNeeded()
        CategoriesVC().loadViewIfNeeded()
        CartVC().loadViewIfNeeded()
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

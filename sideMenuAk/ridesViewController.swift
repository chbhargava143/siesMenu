//
//  ridesViewController.swift
//  sideMenuAk
//
//  Created by chbn on 15/04/20.
//  Copyright © 2020 chbn. All rights reserved.
//

import UIKit

class ridesViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addSlideMenuButton()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func HomeAction(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
       
    }

}

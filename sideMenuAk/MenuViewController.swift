//
//  MenuViewController.swift
//  sideMenuAk
//
//  Created by chbn on 15/04/20.
//  Copyright © 2020 chbn. All rights reserved.
//

import UIKit
protocol SlideMenuDelegate {
    func slideMenuItemSelectedAtIndex(_ index : Int32)
}
enum SideMenu : Int{
    case Profile
    case Rides
    case Community
}
class MenuViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{
   
    let btnArray = ["Profile" , "Rides","Community"]
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var disappearMenu: UIButton!
    @IBOutlet weak var homeBtn: UIButton!
    var btnMenu : UIButton!
    var delegate : SlideMenuDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func disapperTappedMenu(_ sender: UIButton) {
        btnMenu.tag = 0
               
               if (self.delegate != nil) {
                var index = Int32(sender.tag)
                   if(sender == self.disappearMenu){
                       index = -1
                   }
                   delegate?.slideMenuItemSelectedAtIndex(index)
               }
               
               UIView.animate(withDuration: 0.5, animations: { () -> Void in
                   self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height)
                   self.view.layoutIfNeeded()
                   self.view.backgroundColor = UIColor.clear
                   }, completion: { (finished) -> Void in
                       self.view.removeFromSuperview()
                       self.removeFromParent()
               })
    }
    @IBAction func HomeAction(_ sender: Any) {
        let stBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let Home = stBoard.instantiateViewController(identifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(Home, animated: true)
    }
    
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return btnArray.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: "MenuCell") as! MenuCell
        cell.menuLbl.text = btnArray[indexPath.row]
        return cell
      }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch SideMenu(rawValue: indexPath.row) {
        case .Profile:
            
            let pVc = storyboard?.instantiateViewController(identifier: "profileViewController") as! profileViewController
            self.navigationController?.pushViewController(pVc, animated: true)
            break
       
        case .none:
            break
        case .some(.Rides):
             let rVc = storyboard?.instantiateViewController(identifier: "ridesViewController") as! ridesViewController
                           self.navigationController?.pushViewController(rVc, animated: true)
                                  break
        case .some(.Community):
               let cVc = storyboard?.instantiateViewController(identifier: "communityViewController") as! communityViewController
                           self.navigationController?.pushViewController(cVc, animated: true)
                           break
        }
        
    }
}

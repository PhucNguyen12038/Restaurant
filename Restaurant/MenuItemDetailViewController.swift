//
//  MenuItemDetailViewController.swift
//  Restaurant
//
//  Created by nhp on 9/3/19.
//  Copyright © 2019 nhp. All rights reserved.
//

import UIKit

class MenuItemDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailTextLabel: UILabel!
    @IBOutlet weak var addToOrderButton: UIButton!
    var menuItem: MenuItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addToOrderButton.layer.cornerRadius = 5.0
        updateUI()
        
        // Do any additional setup after loading the view.
    }
    
    func updateUI() {
        priceLabel.text = String(format: "$%.2f",menuItem.price)
        titleLabel.text = menuItem.name
        detailTextLabel.text = menuItem.detailText
        MenuController.shared.fetchImage(url: self.menuItem.imageURL){ (image) in
            guard let image = image else {return}
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
        
        
    }
    
    
    @IBAction func orderButtonTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5){
            self.addToOrderButton.transform = CGAffineTransform(scaleX: 3.0, y: 3.0)
            self.addToOrderButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            MenuController.shared.order.menuItems.append(self.menuItem)
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    override func encodeRestorableState(with coder: NSCoder) {
        super.encodeRestorableState(with: coder)
        coder.encode(menuItem.id, forKey: "menuItemId")
    }
}

//
//  ProfileVC.swift
//  Movie observer
//
//  Created by Dmitry Sachkov on 07.06.2021.
//

import UIKit

class ProfileVC: UIViewController {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var phone: UIImageView!
    @IBOutlet weak var mail: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        img.layer.cornerRadius = img.frame.size.width / 2
        img.clipsToBounds = true
        phone.layer.cornerRadius = phone.frame.size.width / 2
        phone.clipsToBounds = true
        mail.layer.cornerRadius = mail.frame.width / 2
        mail.clipsToBounds = true
        img.image = UIImage(named: "mySelf")
        
    }


}

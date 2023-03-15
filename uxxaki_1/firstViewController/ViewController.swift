//
//  ViewController.swift
//  uxxaki_1
//
//  Created by Admin on 09.03.23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func moveButton(_ sender: UIButton) {
        
//        let secondStoryboard = UIStoryboard(name: "Second", bundle: .main)
//
//        let secondVC = secondStoryboard.instantiateViewController(withIdentifier: "SeconsViewController") as? SeconsViewController
//        secondVC?.modalPresentationStyle = .automatic
//
//        self.present(secondVC!, animated: true)
//
        
        let thirdVC = self.storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as? ThirdViewController
        
        self.navigationController?.pushViewController(thirdVC!, animated: true)
    }
    
    
}


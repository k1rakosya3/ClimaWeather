//
//  ThirdViewController.swift
//  uxxaki_1
//
//  Created by Admin on 09.03.23.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var barButton: UINavigationItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        burButtons()
       
        // Do any additional setup after loading the view.
    }
    func burButtons() {
        let myBarButton = UIBarButtonItem(systemItem: .done)
        barButton.title = "myBarButton"
        
    }

    @IBAction func BackAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func goMove(_ sender: UIButton) {
        
        let secondStorybord = UIStoryboard(name: "Second", bundle: .main)
        let secondVC = secondStorybord.instantiateViewController(withIdentifier: "SeconsViewController") as? SeconsViewController
        
        self.navigationController?.pushViewController(secondVC!, animated: true)
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

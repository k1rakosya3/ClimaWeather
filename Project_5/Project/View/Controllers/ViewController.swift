//  ViewController.swift
//  Project_5
//
//  Created by Valodya Galstyan on 23.02.23.
//
// PickerView, UITextView
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewForTap: UIView!
    @IBOutlet weak var myPicker: UIPickerView!
    
    @IBOutlet weak var shashkuQar: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        configPicker()
        addTapGesture()
        addPinchGesture()
    }
    
    
    func configPicker() {
        myPicker.delegate = self
        myPicker.dataSource = self
    }

    
    func addTapGesture() {
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapActoin))
        tapGesture.numberOfTapsRequired = 2
        viewForTap.addGestureRecognizer(tapGesture)
    }
    
    @objc func tapActoin(_ gesture: UITapGestureRecognizer) {
        print("Tapped = \(gesture.numberOfTouches)")
    }
    
    func addPinchGesture() {
        
        let tapGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinchAction))

        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func pinchAction(_ gesture: UIPinchGestureRecognizer) {
        print("Tapped = \(gesture.scale)")
    }
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 12
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let myView = UIView()
        
        
        return myView
    }
    
}

extension ViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
         touches.first?.location(in: self.view)
        
        self.shashkuQar.center = touches.first?.location(in: self.view) ?? view.center
        
    }
    
}

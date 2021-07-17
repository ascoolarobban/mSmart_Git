//
//  ViewController.swift
//  mSmart
//
//  Created by Robin Ellingsen on 2021-07-16.
//

import UIKit




class ViewController: UIViewController {
    //Global never changing.
    let dll = 0.87
    let app = 2995
    
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var field: UITextField!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var month24: UILabel!
    @IBOutlet weak var month36: UILabel!

    @IBOutlet weak var label24: UILabel!
    @IBOutlet weak var label36: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        field.becomeFirstResponder()
        view.backgroundColor = .systemOrange
        field.returnKeyType = .go
        view.layer.cornerRadius = 5.0
        
        
        
       
        
        

        
//
//        let button = UIButton(type: .custom)
//
//        button.frame = CGRect(x: 125, y: 400, width: 150, height: 150)
//        button.layer.cornerRadius = 0.5 * button.bounds.size.width
//        button.clipsToBounds = true
//
//        button.setImage(UIImage(named:""), for: .normal)
//        button.addTarget(self, action: #selector(calculateButton), for: .touchUpInside)
//        view.addSubview(button)
        
        
        
    }
    //stäng tangentbord
    func closeKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }

    
    
    
    @IBAction func calculateButton(_ sender: Any) {

        if let price = field.text{
            if (price == ""){
                return
            }
            else{
                if let num = Double(price){
                    let answer24 = calcAnswer24(num: num)
                    let answer36 = calcAnswer36(num: num)
                    
                    label24.text = "24 Månader"
                    label36.text = "36 Månader"
                    month24.text = String(Int(answer24)) + " SEK/M"
                    month36.text = String(Int(answer36)) + " SEK/M"
                    field.text = ""
                    self.closeKeyboard()
                     
                    
                }
            }
        }
    }
    func calcAnswer24 ( num : Double) -> Double {
        let exVat = num * 0.8
        let total = exVat + dll + Double(app)
        let dividedBy24 = total / 24
        
        return dividedBy24


        
    }
    func calcAnswer36 ( num : Double) -> Double {
        let exVat = num * 0.8
        let total = exVat + dll + Double(app)
        let dividedBy36 = total / 36
        
        return dividedBy36
    }


}




 
 
 

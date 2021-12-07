//
//  ViewController.swift
//  Home work 1
//
//  Created by Данил Албутов on 22.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var label: UILabel!
    
    private var counter: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func onButtonClick(_ sender: UIButton) {
        counter = getIntFromLabel()
        switch sender.tag{
            case 2: // +
                counter += 1
            case 3: // clear
                counter = 0
            case 4: // -
                counter -= 1
            default:
                counter = 0
        }
        label.text = String(counter)
        checkBorder()
    }
    
    func getIntFromLabel() -> Int {
        return Int(label.text!) ?? 0
    }
    
    func callAllert() {
        let alert = UIAlertController(title: "Уведомление", message: "Превышен лимит [-10; 10]", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func checkBorder() {
        if getIntFromLabel() <= -10 {
            buttons[2].isEnabled = false
            callAllert()
        } else if getIntFromLabel() >= 10 {
            buttons[0].isEnabled = false
            callAllert()
        } else {
            buttons[0].isEnabled = true
            buttons[2].isEnabled = true
        }
    }    
}


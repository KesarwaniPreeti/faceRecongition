//
//  ViewController.swift
//  faceRecongition
//
//  Created by Preeti Kesarwani on 10/28/23.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet var mylabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func signInClicked(_ sender: UIButton) {
        let authContext = LAContext()
        var error : NSError?
        
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "is it you")
            // sucess means bool
            { sucess, error in
                if sucess == true {
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "goto", sender: nil)
                        
                    }
                    
                    
                }else {
                    DispatchQueue.main.async {
                        self.mylabel.text = "Try Again"
                    }
                    
                }
            }
            
        }
    
    }
}


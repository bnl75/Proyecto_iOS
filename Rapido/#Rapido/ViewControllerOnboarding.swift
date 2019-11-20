//
//  ViewControllerOnboarding.swift
//  #Rapido
//
//  Created by Laboratorio UNAM-Apple 01 on 10/10/19.
//  Copyright © 2019 ari. All rights reserved.
//

import UIKit

class ViewControllerOnboarding: UIViewController {

    @IBOutlet weak var botonOnboardingRedondo: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        botonOnboardingRedondo.layer.cornerRadius = 7.0
        botonOnboardingRedondo.layer.masksToBounds = true
    }
    

    
    @IBAction func showEscenaDirectorio(_ sender: UIButton) {
        
        
        UserDefaults.standard.set(true, forKey: "session")
        
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

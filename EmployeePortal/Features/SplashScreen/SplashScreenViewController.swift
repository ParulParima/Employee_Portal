//
//  SplashScreenViewController.swift
//  EmployeePortal
//
//  Created by ParulParima on 10/31/22.
//

import UIKit

class SplashScreenViewController: UIViewController {
    
    var navigator: FeaturesCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init() {
    super.init(nibName: "SplashScreenViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        DispatchQueue.main.asyncAfter(deadline: .now() + 4){
            self.navigator?.checkStatus()
        }
    }

}

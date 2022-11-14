//
//  SalaryFilterViewController.swift
//  EmployeePortal
//
//  Created by ParulParima on 11/1/22.
//

import UIKit

class SalaryFilterViewController: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    var delegate: FilterByDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInterface()
    }
    
    func setupInterface() {
        self.contentView.clipsToBounds = true
        self.contentView.layer.cornerRadius = 16
        self.contentView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
    @IBAction func crossButtonTapped(_ sender: Any) {
        self.dismiss(animated: false)
    }
    
    @IBAction func sortByButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true) { [weak self] in
            guard let self = self else { return }
            self.delegate?.filterBySalary(salary: sender.currentTitle ?? "")
        }
    }
    
}

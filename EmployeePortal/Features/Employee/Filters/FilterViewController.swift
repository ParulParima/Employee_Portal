//
//  FilterViewController.swift
//  EmployeePortal
//
//  Created by ParulParima on 11/1/22.
//

import UIKit

class FilterViewController: UIViewController {
    
    var navigator: FeaturesCoordinator?
    var delegate: FilterByDelegate?
    var viewModel: FilterViewModel!
    
    @IBOutlet weak var contentView: UIView!
    
    init(viewModel: FilterViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "FilterViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInterface()
    }
    
    func setupInterface() {
        self.contentView.clipsToBounds = true
        self.contentView.layer.cornerRadius = 16
        self.contentView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
    @IBAction func salaryTapped(_ sender: Any) {
        self.dismiss(animated: false) { [weak self] in
            guard let self = self else { return }
            self.navigator?.showSalaryScene(delegate: self.delegate!)
        }
        
    }
    @IBAction func crossButtonTapped(_ sender: Any) {
        self.dismiss(animated: false)
    }
    
    @IBAction func designationtapped(_ sender: Any) {
        self.dismiss(animated: false) { [weak self] in
            guard let self = self else { return }
            self.navigator?.showDesignationScene(designation: self.viewModel.designation, delegate: self.delegate!)
        }
        
    }
}

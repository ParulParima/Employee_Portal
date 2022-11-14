//
//  SortByViewController.swift
//  EmployeePortal
//
//  Created by ParulParima on 11/1/22.
//

import UIKit

class SortByViewController: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    var delegate: SortByDelegate?
    
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
    
    @IBAction func nameAscendingTapped(_ sender: Any) {
        self.dismiss(animated: false) { [weak self] in
            guard let self = self else { return }
            self.delegate?.sortByNameAscending()
        }
    }
    
    @IBAction func nameDescendingTapped(_ sender: Any) {
        self.dismiss(animated: false) { [weak self] in
            guard let self = self else { return }
            self.delegate?.sortByNameDescending()
        }
    }
    
    @IBAction func salaryLowToHighTapped(_ sender: Any) {
        self.dismiss(animated: false) { [weak self] in
            guard let self = self else { return }
            self.delegate?.sortBySalaryLowToHigh()
        }
    }
    
    @IBAction func salaryHighToLowTapped(_ sender: Any) {
        self.dismiss(animated: false) { [weak self] in
            guard let self = self else { return }
            self.delegate?.sortBySalaryHighToLow()
        }
    }
    
    @IBAction func hiringDateFromOldToNewTapped(_ sender: Any) {
        self.dismiss(animated: false) { [weak self] in
            guard let self = self else { return }
            self.delegate?.sortByHiringOldToNew()
        }
    }
    
    @IBAction func hiringDateFromNewToOldTapped(_ sender: Any) {
        self.dismiss(animated: false) { [weak self] in
            guard let self = self else { return }
            self.delegate?.sortByHiringNewToOld()
        }
    }
    
}

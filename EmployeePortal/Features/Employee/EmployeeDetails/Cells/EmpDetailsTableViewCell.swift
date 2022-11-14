//
//  EmpDetailsTableViewCell.swift
//  EmployeePortal
//
//  Created by ParulParima on 11/1/22.
//

import UIKit

class EmpDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var key: UILabel!
    @IBOutlet weak var value: UILabel!
    
    static let identifier = "EmpDetailsTableViewCell"
    
    static func nib() -> UINib {
           return UINib(nibName: "EmpDetailsTableViewCell", bundle: nil)
       }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setup(key: String, value: String) {
        self.key.text = key
        self.value.text = value
        
    }
    
}

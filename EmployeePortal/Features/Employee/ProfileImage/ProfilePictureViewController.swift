//
//  ProfilePictureViewController.swift
//  EmployeePortal
//
//  Created by ParulParima on 11/1/22.
//

import UIKit

class ProfilePictureViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var viewModel: ProfilePictureViewModel!
    
    
    init(viewModel: ProfilePictureViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "ProfilePictureViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = URL(string: viewModel.image) else { return }
        if let data = try? Data(contentsOf: url) {
            imageView.image = UIImage(data: data)
        }
        
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.dismiss(animated: false)
    }
}

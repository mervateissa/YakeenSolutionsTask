//
//  ViewController.swift
//  YackeenSolutionsTask
//
//  Created by mervat on 24/12/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        ApiClient.performCustomRequest(endUrl: KNetworkConstants.EndPoint.popularShows.rawValue, type: [PouplerShowsModel].self) { result in
            switch result {
            case .success(let popularShows):
                print(popularShows)
            case .failure(let error):
                print(error)
            }
        }
    }


}


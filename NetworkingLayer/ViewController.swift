//
//  ViewController.swift
//  NetworkingLayer
//
//  Created by Christopher Olsen on 5/21/18.
//  Copyright © 2018 Christopher Olsen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var viewModel: MoviesViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = MoviesViewModel()
        
        // TODO: setup observation of the viewModel to refresh the view
        
        viewModel.getNewMovies()
    }
}


//
//  ViewController.swift
//  NetworkingLayer
//
//  Created by Christopher Olsen on 5/21/18.
//  Copyright © 2018 Christopher Olsen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var networkManager: NetworkManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkManager = NetworkManager()
        
        networkManager.getNewMovies(page: 1) { movies, error in
            if let error = error {
                print(error)
            }
            
            if let movies = movies {
                print(movies)
            }
        }
    }
}


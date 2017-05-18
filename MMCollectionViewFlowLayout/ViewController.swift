//
//  ViewController.swift
//  MMCollectionViewFlowLayout
//
//  Created by Iean on 2017/5/18.
//  Copyright © 2017年 Iean. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    private let transitions: [(MMLayoutProtocol, Bool)] = [(ParallaxAttributesTransition(), true),
                                                                 (ZoomInOutAttributesTransition(), true),
                                                                 (RotateInOutAttributesTransition(), false),
                                                                 (LinearCardAttributesTransition(), false),
                                                                 (CubeAttributesTransition(), true),
                                                                 (CrossFadeAttributesTransition(), true),
                                                                 (TurnAttributesTransition(), true),
                                                                 (PageAttributesTransition(), true)]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dist = segue.destination as? ImageCollectionViewController, let indexPath = sender as? IndexPath {
            dist.transition = transitions[indexPath.row]
        }
    }
    
    // MARK: - TableView Delegate and DataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let c = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        c.textLabel?.font = UIFont.systemFont(ofSize: 12)
        c.textLabel?.text = "\(transitions[indexPath.row].0.self)"
        
        return c
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowCollectionViewController", sender: indexPath)
    }

}


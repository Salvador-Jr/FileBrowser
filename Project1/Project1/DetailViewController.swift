//
//  DetailViewController.swift
//  Project1
//
//  Created by Salvador Rodriguez on 8/27/20.
//  Copyright © 2020 Salvador Rodriguez. All rights reserved.
//

import Cocoa

class DetailViewController: NSViewController {
    @IBOutlet var imageView: NSImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    func imageSelected(name:String){
        imageView.image = NSImage(named: name)
    }
}

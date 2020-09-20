//
//  SourceViewController.swift
//  Project1
//
//  Created by Salvador Rodriguez on 8/27/20.
//  Copyright © 2020 Salvador Rodriguez. All rights reserved.
//

import Cocoa

class SourceViewController: NSViewController, NSTableViewDelegate, NSTableViewDataSource {
    @IBOutlet var tableView: NSTableView!
    var pictures  = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        for items in items {
            if items.hasPrefix("nssl"){
                pictures.append(items)
            }
        }
        // Do view setup here.
    }
    func numberOfRows(in tableView: NSTableView) -> Int {
        return pictures.count
    }
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let vw = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else {return nil}
        vw.textField?.stringValue = pictures[row]
        return vw
    }
    func tableViewSelectionDidChange(_ notification: Notification) {
        guard tableView.selectedRow != -1 else{return}
        guard let splitVC = parent as? NSSplitViewController else {return}
        if let detail = splitVC.children[1] as? DetailViewController{
            detail.imageSelected(name: pictures [tableView.selectedRow])
        }
    }
}

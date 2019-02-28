//
//  ViewController.swift
//  TagFieldView
//
//  Created by churabou on 03/01/2019.
//  Copyright (c) 2019 churabou. All rights reserved.
//

import UIKit
import TagFieldView

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let t = TagField()
        t.style.makeCircle()
        
        view.addSubview(t)
        t.frame = .init(x: 0, y: 100, width: view.bounds.width, height: 100)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


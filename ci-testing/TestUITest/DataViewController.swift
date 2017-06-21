//
//  DataViewController.swift
//  TestUITest
//
//  Created by Max Ainatchi on 6/12/17.
//  Copyright © 2017 Max Ainatchi, Inc. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {

    @IBOutlet weak var dataLabel: AUILabel! {
        didSet {
            self.dataLabel.addObserver(self, forKeyPath: "text", options: [.new, .old], context: nil)
        }
    }
    @IBOutlet weak var increaseCountButton: UIButton!
    @IBOutlet weak var decreaseCountButton: UIButton!
    var dataObject: String = ""
    var count = 0 {
        didSet {
            self.dataLabel.text = "You tapped me \(self.count) time\(self.count == 1 ? "" : "s")!"
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.count = 0
    }

    @IBAction func didTapIncrease(_ sender: Any) {
        self.count += 1
    }
    
    @IBAction func didTapDecrease(_ sender: Any) {
        self.count -= 1
    }
}


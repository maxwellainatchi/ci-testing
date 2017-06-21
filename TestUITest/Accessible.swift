//
//  Accessible.swift
//  TestUITest
//
//  Created by Max Ainatchi on 6/12/17.
//  Copyright © 2017 Max Ainatchi, Inc. All rights reserved.
//

import UIKit

class AUILabel: UILabel {
    var accessibilityTitle: String?
    override var text: String? {
        didSet {
            if let text = self.text {
                self.accessibilityLabel = "\(text)"
            }
        }
    }
}

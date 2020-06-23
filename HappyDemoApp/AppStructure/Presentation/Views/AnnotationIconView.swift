//
//  AnnotationIconView.swift
//  HappyDemoApp
//
//  Created by Farshad Mousalou on 6/24/20.
//  Copyright © 2020 Farshad Mousalou. All rights reserved.
//

import UIKit
import PureLayout

class AnnotationIconView: UIView {
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    private lazy var label: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 10.0, weight: .regular)
        label.textColor = .white
        label.backgroundColor = .clear
        return label
    }()
    
    var title: String = "" {
        didSet {
            print("\(self) title = \(title)")
            label.text = title
            invalidateIntrinsicContentSize()
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        self.backgroundColor = .red
        label.autoPinEdgesToSuperviewMargins()
        label.text = title
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = min(frame.height,frame.width) / 2
    }

}

//
//  View.swift
//  ViewControllerLifeCycle
//
//  Created by shyam-15059 on 13/12/22.
//

import UIKit

class View: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    private let presentButton = UIButton()
    
    var userDidTapPresentButton: (() -> ())?
    
      

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.backgroundColor = .white
        self.addSubview(self.presentButton)
        self.presentButton.setTitle("Present", for: .normal)
        self.presentButton.setTitleColor(.systemBlue, for: .normal)
        self.presentButton.addTarget(self, action: #selector(presentButtonTapped(_:)), for: .touchUpInside)

      }

      required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
      }

      @objc private func presentButtonTapped(_ sender: UIButton) {
        self.userDidTapPresentButton?()
      }

      override func layoutSubviews() {
        super.layoutSubviews()

        self.presentButton.frame = .zero
        self.presentButton.sizeToFit()
        self.presentButton.center = self.center

      }
}

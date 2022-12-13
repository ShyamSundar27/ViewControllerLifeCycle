//
//  ViewController.swift
//  ViewControllerLifeCycle
//
//  Created by shyam-15059 on 13/12/22.
//

import UIKit

class ViewControllerLifeCycle: UIViewController {
    
    
    
    let name: String

    init(name: String) {
        self.name = name
        super.init(nibName: nil, bundle: nil)
      }
      
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
      }
      
    override func loadView() {
        super.loadView()
        self.logMethod()
        let view = View()

        view.userDidTapPresentButton = { [unowned self] in
//            let newVC = ViewControllerLifeCycle(name: "NewVC")
            let newVC = UINavigationController(rootViewController: ViewControllerLifeCycle(name: "NewVC"))
            newVC.modalPresentationStyle = .pageSheet
//            self.navigationController?.pushViewController(newVC, animated:  true)
            self.present(newVC, animated: true)
        }

        self.view = view
      }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.logMethod()
        if(name != "MainVC"){
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(leftBarButtonClicked))
              navigationItem.leftBarButtonItem?.tintColor = .systemRed
        }
        
    }
    @objc func leftBarButtonClicked (){
        dismiss(animated: true , completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.logMethod()
      }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.logMethod()
      }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.logMethod()
      }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.logMethod()
      }

    func logMethod(function: StaticString = #function) {
        print("VC \(self.name) - \(function) invoked")
      }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.logMethod()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.logMethod()
    }

}


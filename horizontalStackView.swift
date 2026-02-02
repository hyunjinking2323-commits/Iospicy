//
//
////  ViewController.swift
////  Calculator App
////
////  Created by t2025-m0239 on 2026.01.28.
////
//// Lv. 2 
//import UIKit
//import SnapKit
//
//class ViewController: UIViewController {
//    
//    let label = UILabel()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        configureUI()
//    }
//    
//    private func configureUI() {
//        view.backgroundColor = .black
//        
//        label.textColor = .white
//        label.text = "12345"
//        label.textAlignment = .right
//        label.font = .boldSystemFont(ofSize: 60)
//        
//        view.addSubview(label)
//        
//        label.snp.makeConstraints {
//            $0.leading.equalToSuperview().offset(30)
//            $0.trailing.equalToSuperview().inset(30)
//            $0.top.equalToSuperview().offset(200)
//            $0.height.equalTo(100)
//        }
//        
//        
//        let button1 = makeButton(title: "7")
//        let button2 = makeButton(title: "8")
//        let button3 = makeButton(title: "9")
//        let button4 = makeButton(title: "+")
//        
//        let firstStackView = makeHorizontalStackView([button1, button2, button3, button4])
//        
//        view.addSubview(firstStackView)
//        firstStackView.snp.makeConstraints {
//            $0.top.equalTo(label.snp.bottom).offset(20)
//            $0.leading.equalToSuperview().offset(30)
//            $0.trailing.equalToSuperview().inset(30)
//            $0.height.equalTo(80)
//        }
//    }
//    
//    private func makeButton(title: String) -> UIButton {
//        let button = UIButton(type: .system)
//        button.setTitle(title, for: .normal)
//        button.setTitleColor(.white, for: .normal)
//        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
//        button.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
//        button.layer.cornerRadius = 40
//        return button
//    }
//    
//    private func makeHorizontalStackView(_ views: [UIView]) -> UIStackView {
//        let stackView = UIStackView(arrangedSubviews: views)
//        stackView.axis = .horizontal
//        stackView.backgroundColor = .black
//        stackView.spacing = 10
//        stackView.distribution = .fillEqually
//        
//        return stackView
//    }
//    
//}

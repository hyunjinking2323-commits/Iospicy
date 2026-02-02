////  ViewController.swift
////  Calculator App
////
////  Created by t2025-m0239 on 2026.01.28.
////
//// Lv.1
//import UIKit
//import SnapKit
//
//let label = UILabel()
//
//class ViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        configureUI()
//    }
//
//    private func configureUI() {
//        view.backgroundColor = .black
//        label.text = "12345"
//        label.textColor = .white
//        label.textAlignment = .right
//        label.font = .boldSystemFont(ofSize: 60)
//
//        [label].forEach { view.addSubview($0) }
//
//        label.snp.makeConstraints {
//            $0.leading.trailing.equalToSuperview().offset(-30)
//            $0.top.equalTo(200)
//            $0.height.equalTo(100)
//
//        }
//    }
//}

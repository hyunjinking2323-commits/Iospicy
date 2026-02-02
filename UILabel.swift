//
//  ViewController.swift
//  계산기 앱 만들기
//
//  Created by t2025-m0239 on 2026.01.26.
//
//    Lv.1
//    backgroundColor = .black
//    textColor = .white
//    - 우선, 텍스트는 `12345` 로 고정
//    - 텍스트 오른쪽 정렬
//    - Font = 시스템 볼드체, 사이즈 60
//    AutoLayout
//    - leading, trailing = superView 로 부터 30 떨어지도록 세팅
//    - top = superView 로 부터 200 떨어지도록 세팅
//    - height = 100

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





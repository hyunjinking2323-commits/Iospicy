////
////  ViewController.swift
////  Calculator App
////
////  Created by t2025-m0239 on 2026.01.28.
////
//
//import UIKit
//import SnapKit
//
//// lv. 1 계산기 화면을 구성하는 기본 뷰 컨트롤러
//class ViewController: UIViewController {
//    
//    // 결과(표시) 값을 나타내는 상단 라벨
//    let label = UILabel()
//   
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        configureUI()
//    }
//    
//    // 전체 UI 요소 생성 및 배치 로직
//    private func configureUI() {
//        // 전체 배경을 검정색으로 설정 (계산기 스타일)
//        view.backgroundColor = .black
//        
//        // 상단 결과 라벨 스타일 설정
//        label.textColor = .white
//        label.text = "12345"
//        label.textAlignment = .right
//        label.font = .boldSystemFont(ofSize: 60)
//        
//        // 라벨 추가 및 오토레이아웃 제약 설정
//        view.addSubview(label)
//        label.snp.makeConstraints {
//            $0.leading.equalToSuperview().offset(30)  // 왼쪽 여백 30
//            $0.trailing.equalToSuperview().inset(30)  // 오른쪽 여백 30
//            $0.top.equalToSuperview().offset(200)     // 상단에서 200 아래
//            $0.height.equalTo(100)                     // 고정 높이 100
//        }
//        
//        // lv. 3
//        // 4열 계산기 배열 구성을 위한 버튼 타이틀 목록 (행 단위로 4개씩)
//        let titles = ["7", "8", "9", "+",
//                      "4", "5", "6", "-",
//                      "1", "2", "3", "*",
//                     "AC", "0", "=", "/"]
//        
//        // titles 배열을 4개씩 끊어 2차원 배열(행)로 변환
//        let rows: [[String]] = stride(from: 0, to: titles.count, by: 4).map { start in
//            let end = min(start + 4, titles.count)
//            return Array(titles[start..<end])
//        }
//        
//        // 각 행의 문자열을 버튼으로 바꾸고, 가로 스택뷰로 묶기
//        let horizontalRows: [UIStackView] = rows.map { rowTitles in
//            let buttons = rowTitles.map { makeButton(title: $0) }
//            return makeHorizontalStackView(buttons)
//        }
//        
//        // 가로 스택뷰들을 세로로 쌓는 메인 스택뷰
//        let verticalStackView = UIStackView(arrangedSubviews: horizontalRows)
//        verticalStackView.axis = .vertical       // 세로 방향
//        verticalStackView.backgroundColor = .black  // 배경색 일관성 유지
//        verticalStackView.spacing = 10           // 행 간 간격 10
//        verticalStackView.distribution = .fillEqually  // 각 행 높이를 균등 분배
//        
//        // 메인 세로 스택뷰 추가 및 제약
//        view.addSubview(verticalStackView)
//        verticalStackView.snp.makeConstraints {
//            $0.top.equalTo(label.snp.bottom).offset(60)   // 라벨 아래 60 간격
//            $0.centerX.equalToSuperview()                  // 수평 중앙 정렬
//            $0.width.equalTo(350)                           // 고정 너비 350
//        }
//    }
//    
//    // lv. 2 공통 버튼 생성 유틸리티: 타이틀/스타일/크기 지정 후 반환
//    private func makeButton(title: String) -> UIButton {
//        let button = UIButton(type: .system)
//        button.setTitle(title, for: .normal)
//        button.setTitleColor(.white, for: .normal)
//        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
//        button.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
//        button.layer.cornerRadius = 40
//         // 버튼 자체 크기(정사각형 80x80) 제약
//        button.snp.makeConstraints { make in
//            make.width.height.equalTo(80)}
//        return button
//    }
//    
//    // 전달받은 뷰 배열을 가로로 균등 배치하는 스택뷰 생성
//    private func makeHorizontalStackView(_ views: [UIView]) -> UIStackView {
//        let stackView = UIStackView(arrangedSubviews: views)
//        stackView.axis = .horizontal        // 가로 방향
//        stackView.backgroundColor = .black  // 배경색 일관성
//        stackView.spacing = 10              // 뷰 간 간격 10
//        stackView.distribution = .fillEqually  // 각 아이템 너비 균등 분배
//        return stackView
//    }
//    
//    // lv. 3
//    private func makeVerticalStackView(_ views: [UIView]) -> UIStackView {
//        let stackView = UIStackView(arrangedSubviews: views)
//        stackView.axis = .vertical
//        stackView.backgroundColor = .black
//        stackView.spacing = 10
//        stackView.distribution = .fillEqually
//        return stackView
//    }
//}
//

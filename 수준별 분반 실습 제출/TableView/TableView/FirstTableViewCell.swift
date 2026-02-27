//
//  FirstViewControllerCell.swift
//  TableView
//
//  Created by t2025-m0239 on 2026.02.12.
//
 //FirstTableViewCell
//  프로퍼티
//
//  menuLabel (UILabel)
//  menuImageView (UIImageView)
//  이미지뷰는 셀의 상하좌로 8간격
//  레이블은 이미지뷰 오른쪽으로 8 간격 및 셀의 y축 가운데 위치
//
//  메서드
//
//  이름은 configure, 파라미터로 data라는 이름의 String 타입을 받고
//  Menu 값을 받아서 imageView에 image, label의 text에 name 설정
//
//코드베이스, SnapKit 사용
//
//1. 테이블뷰 객체를 만든다
//2. 테이블뷰를 뷰에 추가한다. 레이아웃 설정한다.
//3. 데이터를 만든다.
//4. Delegate, DataSource 설정한다.
//5. Cell을 만들고 register 한다.
//6. cellForRowAt에서 데이터 설정을 한다.
import UIKit
import SnapKit

class FirstTableViewCell: UITableViewCell {
    
    let menuLabel = UILabel()
    let menuImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        configureUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        [menuLabel,menuImageView].forEach{contentView.addSubview($0)
        }
    }
    func setConstraints() {
        menuImageView.snp.makeConstraints {
            $0.leading.top.bottom.equalToSuperview().inset(8)
        }
        
        menuLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(menuImageView.snp.trailing).offset(8)
        }
    }
    
    func configure(data: Menu) {
        menuLabel.text = data.name
        menuImageView.image = data.image
    }
}
        //
        //    FirstTableViewCell
        //      프로퍼티
        //
        //      menuLabel (UILabel)
        //      menuImageView (UIImageView)
        //      이미지뷰는 셀의 상하좌로 8간격
        //      레이블은 이미지뷰 오른쪽으로 8 간격 및 셀의 y축 가운데 위치
        //
        //      메서드
        //
        //      이름은 configure, 파라미터로 data라는 이름의 Menu 타입을 받고
        //      Menu 값을 받아서 imageView에 image, label의 text에 name 설정
        //
        //    코드베이스, SnapKit 사용


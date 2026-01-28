//
//  ViewController.swift
//  ViewController
//
//  Created by t2025-m0239 on 2026.01.26.
//
import UIKit

class Printer {
    let name: String = "우현진"
}

class MainViewController: UIViewController {
    
    let printer = Printer() 
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
   
    private func printName() {
        
    }
        
    
}

//뷰컨트롤러
//  뷰컨트롤러 이름 : MainViewController
//프로퍼티
//  프로퍼티명 printer
//  Printer 인스턴스
//viewDidLoad에서 printer의 printName 함수 실행




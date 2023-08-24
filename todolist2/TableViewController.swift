//
//  TableViewController.swift
//  todolist2
//
//  Created by DJ S on 2023/08/24.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // 데이터 소스로 사용할 배열
    var dataSource = ["항목 1", "항목 2", "항목 3", "항목 4", "항목 5"]

    
    // 테이블 뷰 생성
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 테이블 뷰를 뷰 컨트롤러의 서브뷰로 추가
        view.addSubview(tableView)
        
        // 테이블 뷰의 레이아웃 설정
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        // 테이블 뷰의 데이터 소스와 델리게이트를 설정
        tableView.dataSource = self
        tableView.delegate = self
        
        // 테이블 뷰 셀 등록
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    // 데이터 소스 메서드 - 테이블 뷰 셀 개수 반환
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    // 데이터 소스 메서드 - 테이블 뷰 셀 생성 및 반환
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }
    
    // 델리게이트 메서드 - 테이블 뷰 셀 선택 시 동작
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("선택된 항목: \(dataSource[indexPath.row])")
    }
}


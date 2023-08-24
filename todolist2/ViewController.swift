//
//  ViewController.swift
//  todolist2
//
//  Created by DJ S on 2023/08/24.
//

import UIKit

final class ViewController: UIViewController {
    
    private var checkTask: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.setTitleColor(UIColor.blue, for: .normal)
        
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        
        
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        button.setTitle("할일 확인하기", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(checkTapped), for: .touchUpInside)
        return button
    }()
    
    private var completedTask: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.setTitleColor(UIColor.blue, for: .normal)
        
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        button.setTitle("완료한일 보기", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(completedTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [checkTask, completedTask])
        stview.spacing = 18
        stview.axis = .vertical
        stview.distribution = .fillEqually
        stview.alignment = .fill
        return stview
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit // 이미지가 비율을 유지하며 적절하게 표시되도록 설정
        return imageView
    }()
    
    private let textViewHeight: CGFloat = 36
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        makeUI()
        loadImageFromURL()
    }
    
    func makeUI() {
        view.addSubview(stackView)
        view.addSubview(imageView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -250),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            stackView.heightAnchor.constraint(equalToConstant: textViewHeight*3 + 36),
            
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
                        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                        imageView.widthAnchor.constraint(equalToConstant: 200), // 이미지 뷰의 너비
                        imageView.heightAnchor.constraint(equalToConstant: 200) // 이미지 뷰의 높이
        ])
    }
    
//이미지뷰 넣기
    func loadImageFromURL() {
            let imageUrlString = "https://spartacodingclub.kr/css/images/scc-og.jpg"
            if let imageUrl = URL(string: imageUrlString) {
                DispatchQueue.global().async {
                    if let imageData = try? Data(contentsOf: imageUrl) {
                        DispatchQueue.main.async {
                            if let image = UIImage(data: imageData) {
                                self.imageView.image = image
                            }
                        }
                    }
                }
            }
        }
    
    @objc func checkTapped() {
        print("할일 확인하기")
        let firstVC = TableViewController()
        navigationController?.pushViewController(firstVC, animated: true)
//        let tableViewController = TableViewController() // TableViewController의 인스턴스 생성
//            navigationController?.pushViewController(tableViewController, animated: true)
    }
    
    @objc func completedTapped() {
        print("완료한일 보기")
    }
    
}


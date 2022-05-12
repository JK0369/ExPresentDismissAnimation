//
//  VC2.swift
//  ExPresent
//
//  Created by Jake.K on 2022/05/12.
//

import UIKit

class VC2: UIViewController {
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "VC2"
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .black
    return label
  }()
  private let button: UIButton = {
    let button = UIButton()
    button.setTitle("다음 화면 push", for: .normal)
    button.setTitleColor(.systemBlue, for: .normal)
    button.setTitleColor(.blue, for: .highlighted)
    button.addTarget(self, action: #selector(didTap), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  private let myView: UIView = {
    let view = UIView()
    view.backgroundColor = .systemGray
    return view
  }()
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .systemGreen
    self.view.addSubview(self.myView)
    self.view.addSubview(self.titleLabel)
    self.view.addSubview(self.button)
    NSLayoutConstraint.activate([
      self.titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 30),
      self.titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
    ])
    NSLayoutConstraint.activate([
      self.button.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 70),
      self.button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
    ])
  }
  
  @objc private func didTap() {
    let vc = VC3()
    self.navigationController?.pushViewController(vc, animated: true)
  }
  
  func show() {
    DispatchQueue.main.async {
      self.myView.snp.remakeConstraints {
        $0.edges.equalToSuperview()
      }
      UIView.animate(
        withDuration: 0.3,
        delay: 0,
        options: .curveEaseInOut,
        animations: { self.view.layoutIfNeeded() },
        completion: nil
      )
    }
  }
  
  func hide() {
    DispatchQueue.main.async {
      self.myView.snp.remakeConstraints {
        $0.top.equalTo(self.view.snp.bottom)
        $0.left.right.equalToSuperview()
      }
      self.view.layoutIfNeeded()
    }
  }
}

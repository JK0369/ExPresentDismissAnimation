//
//  ViewController.swift
//  ExPresent
//
//  Created by Jake.K on 2022/05/12.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "VC1"
    label.textColor = .black
    return label
  }()
  private let vc2 = VC2()
  lazy var nav = UINavigationController(rootViewController: self.vc2)
  private let button: UIButton = {
    let button = UIButton()
    button.setTitle("VC1 위에 떠있는 버튼", for: .normal)
    button.setTitleColor(.red, for: .normal)
    return button
  }()
  private let openButton: UIButton = {
    let button = UIButton()
    button.setTitle("open", for: .normal)
    button.setTitleColor(.systemBlue, for: .normal)
    button.setTitleColor(.blue, for: .highlighted)
    button.addTarget(self, action: #selector(openView), for: .touchUpInside)
    return button
  }()
  private let closeButton: UIButton = {
    let button = UIButton()
    button.setTitle("close", for: .normal)
    button.setTitleColor(.systemBlue, for: .normal)
    button.setTitleColor(.blue, for: .highlighted)
    button.addTarget(self, action: #selector(closeView), for: .touchUpInside)
    return button
  }()
  
  private var myView: UIView {
    self.nav.view
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.addSubview(self.titleLabel)
    self.view.addSubview(self.myView)
    self.view.addSubview(self.button)
    self.view.addSubview(self.openButton)
    self.view.addSubview(self.closeButton)
    
    self.titleLabel.snp.makeConstraints {
      $0.top.equalToSuperview().inset(50)
      $0.centerX.equalToSuperview()
    }
    self.openButton.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.top.equalToSuperview().inset(120)
    }
    self.closeButton.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.top.equalToSuperview().inset(160)
    }
    self.myView.snp.makeConstraints {
      $0.left.right.bottom.equalToSuperview()
      $0.top.equalTo(self.view.snp.bottom).priority(999)
    }
    self.button.snp.makeConstraints {
      $0.bottom.equalToSuperview().inset(150)
      $0.centerX.equalToSuperview()
    }
  }
  
  @objc private func openView() {
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
  
  @objc private func closeView() {
    DispatchQueue.main.async {
      self.myView.snp.remakeConstraints {
        $0.left.right.bottom.equalToSuperview()
        $0.top.equalTo(self.view.snp.bottom).priority(999)
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
}

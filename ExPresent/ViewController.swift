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
  private var vc2: VC2?
  private let aboveButton: UIButton = {
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
  var nav: UINavigationController? // strong self해주기 위함 (안해주면 VC2에서 nil이 되어 push가 안됨)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.addSubview(self.titleLabel)
    self.view.addSubview(self.aboveButton)
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
    self.aboveButton.snp.makeConstraints {
      $0.bottom.equalToSuperview().inset(150)
      $0.centerX.equalToSuperview()
    }
  }
}

// MARK: VC2
extension ViewController {
  @objc private func openView() {
    guard self.vc2 == nil else { return }
    let vc2 = VC2()
    self.vc2 = vc2
    let nav = UINavigationController(rootViewController: vc2)
    self.nav = nil
    self.nav = nav
    self.view.insertSubview(nav.view, belowSubview: self.aboveButton)
    nav.view.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    vc2.show()
  }
  
  @objc private func closeView() {
    guard self.vc2 != nil else { return }
    self.vc2?.hide { [weak self] in
      self?.vc2?.view.removeFromSuperview()
      self?.vc2 = nil
    }
  }
}

//
//  VC2.swift
//  ExPresent
//
//  Created by Jake.K on 2022/05/12.
//

import UIKit
import SnapKit

class VC2: UIViewController {
  private let containerView: UIView = {
    let view = UIView()
    return view
  }()
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "VC2"
    label.textColor = .black
    return label
  }()
  private let button: UIButton = {
    let button = UIButton()
    button.setTitle("다음 화면 push", for: .normal)
    button.setTitleColor(.systemBlue, for: .normal)
    button.setTitleColor(.blue, for: .highlighted)
    button.addTarget(self, action: #selector(pushVC), for: .touchUpInside)
    return button
  }()
  
  // viewDidLoad가 아닌 init()에서 설정안하면, show()메소드가 호출되었을때 containerView가 아직 addSubview되지 않은 상태라 크래시가 발생
  init() {
    super.init(nibName: nil, bundle: nil)
    self.view.backgroundColor = .clear
    self.containerView.backgroundColor = .systemGreen
    
    self.view.addSubview(self.containerView)
    self.containerView.addSubview(self.titleLabel)
    self.containerView.addSubview(self.button)
    
    self.containerView.snp.makeConstraints {
      $0.left.right.equalToSuperview()
      $0.top.equalTo(self.view.snp.bottom).priority(999)
    }
    self.titleLabel.snp.makeConstraints {
      $0.top.equalToSuperview().inset(30)
      $0.centerX.equalToSuperview()
    }
    self.button.snp.makeConstraints {
      $0.top.equalToSuperview().inset(70)
      $0.centerX.equalToSuperview()
    }
    
    // layoutIfNeeded호출 안해줄 경우, 좌측 상단에서 레이아웃이 시작
    self.view.layoutIfNeeded()
  }
  required init?(coder: NSCoder) {
    fatalError()
  }
  
  @objc private func pushVC() {
    let vc = VC3()
    self.navigationController?.pushViewController(vc, animated: true)
  }
  
  func show(completion: @escaping () -> Void = {}) {
    self.containerView.snp.remakeConstraints {
      $0.edges.equalToSuperview()
    }
    UIView.animate(
      withDuration: 0.3,
      delay: 0,
      options: .curveEaseInOut,
      animations: { self.view.layoutIfNeeded() },
      completion: { _ in completion() }
    )
  }
  
  func hide(completion: @escaping () -> Void = {}) {
    self.containerView.snp.remakeConstraints {
      $0.left.right.equalToSuperview()
      $0.top.equalTo(self.view.snp.bottom).priority(999)
    }
    UIView.animate(
      withDuration: 0.3,
      delay: 0,
      options: .curveEaseInOut,
      animations: { self.view.layoutIfNeeded() },
      completion: { _ in completion() }
    )
  }
}

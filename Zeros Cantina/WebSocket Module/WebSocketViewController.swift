// 
//  WebSocketViewController.swift
//  Zeros Cantina
//
//  Created by Anton Zyryanov on 09.08.2025.
//

import UIKit

protocol WebSocketViewControllerProtocol: AnyObject {
    func showServerResponse(message: String)
}

final class WebSocketViewController: UIViewController, WebSocketViewControllerProtocol {
    
    public var presenter: WebSocketPresenterProtocol!
    
    private var menuIcon: UIImageView = UIImageView(frame: .zero)
    private var sendMessageIcon: UIImageView = UIImageView(frame: .zero)
    private let serverMessagesLabel: UILabel = UILabel(frame: .zero)
    private let messageTextView = UITextView()
    private let serverMessagesTableView: UITableView = UITableView(frame: .zero)
    private var serverMessagesPresentationModels: [WebSocketInputModel] = []
    
    override public func viewDidLoad() -> () {
        super.viewDidLoad()
        setupView()
        setupKeyboard()
    }
    
    private func setupView() {
        setupBackgroundImage()
        setupMenuIcon()
        setupSendMessageIcon()
        
        view.isUserInteractionEnabled = true
        
        setupSendMessageLabel()
        setupServerMessagesTableView()
    }
    
    private func setupBackgroundImage() {
        let backgroundImage = UIImage(named: "stars_background")
        let backgroundImageView = UIImageView(image: backgroundImage)
        self.view.addSubview(backgroundImageView)
        
        backgroundImageView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalToSuperview().inset(64)
        }
    }
    
    private func setupMenuIcon() {
        self.view.addSubview(menuIcon)
        let menuImage = UIImage(named: "home_icon")?.withRenderingMode(.alwaysTemplate)
        menuIcon.tintColor = .yellow
        menuIcon.image = menuImage
        menuIcon.snp.makeConstraints { make in
            make.height.width.equalTo(32)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(20)
            make.leading.equalToSuperview().inset(32)
        }
        let menuTap = UITapGestureRecognizer(target: self, action: #selector(self.menuTapAction))
        menuIcon.addGestureRecognizer(menuTap)
        menuIcon.isUserInteractionEnabled = true
    }
    
    private func setupSendMessageIcon() {
        self.view.addSubview(sendMessageIcon)
        let sendMessageImage = UIImage(named: "send_request")?.withRenderingMode(.alwaysTemplate)
        sendMessageIcon.tintColor = .yellow
        sendMessageIcon.image = sendMessageImage
        sendMessageIcon.snp.makeConstraints { make in
            make.height.width.equalTo(32)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(20)
            make.trailing.equalToSuperview().inset(32)
        }
        let sendMessageTap = UITapGestureRecognizer(target: self, action: #selector(self.sendMessage))
        sendMessageIcon.addGestureRecognizer(sendMessageTap)
        sendMessageIcon.isUserInteractionEnabled = true
    }
    
    private func setupMessageTextView() {
        self.view.addSubview(messageTextView)
        messageTextView.snp.makeConstraints { make in
            make.top.equalTo(menuIcon.snp.bottom).inset(-32)
            make.leading.trailing.equalToSuperview().inset(32)
            make.height.equalTo(150)
        }
        messageTextView.backgroundColor = .purple
        messageTextView.layer.borderColor = UIColor.yellow.cgColor
        messageTextView.layer.borderWidth = 2
        messageTextView.layer.cornerRadius = 16
        messageTextView.font = .boldSystemFont(ofSize: 24)
        messageTextView.textColor = .white
        messageTextView.delegate = self
    }
    
    private func setupSendMessageLabel() {
        setupMessageTextView()
        
        self.view.addSubview(serverMessagesLabel)
        serverMessagesLabel.text = "Server Messages:"
        serverMessagesLabel.textColor = .yellow
        serverMessagesLabel.font = .boldSystemFont(ofSize: 24)
        serverMessagesLabel.snp.makeConstraints { make in
            make.top.equalTo(messageTextView.snp.bottom).inset(-32)
            make.leading.trailing.equalToSuperview().inset(32)
            make.height.equalTo(40)
        }
    }
    
    private func setupServerMessagesTableView() {
        self.view.addSubview(serverMessagesTableView)
        serverMessagesTableView.snp.makeConstraints { make in
            make.top.equalTo(serverMessagesLabel.snp.bottom).inset(-20)
            make.bottom.equalTo(view.snp.bottom).inset(0)
            make.leading.trailing.equalToSuperview().inset(32)
        }
        self.serverMessagesTableView.register(WSServerMessageCell.self, forCellReuseIdentifier: WSServerMessageCell.cellID)
        serverMessagesTableView.delegate   = self
        serverMessagesTableView.dataSource = self
        serverMessagesTableView.backgroundColor = .clear
    }
    
    @objc private func menuTapAction() {
        self.presenter.closeModule()
    }
    
    @objc private func sendMessage() {
        Task {
            await self.presenter.sendMessageToServer(message: messageTextView.text)
        }
    }
    
    private func setupKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    func showServerResponse(message: String) {
        serverMessagesPresentationModels.append(.init(serverMessage: message))
        DispatchQueue.main.async {
            self.serverMessagesTableView.reloadData()
            self.view.layoutIfNeeded()
        }
    }
    
}

extension WebSocketViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
            if text == "\n" {
                textView.resignFirstResponder() 
                return false
            }
            return true
        }
}

extension WebSocketViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        serverMessagesPresentationModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WSServerMessageCell.cellID, for: indexPath) as? WSServerMessageCell else {
            return UITableViewCell()
        }
        cell.setupCellUI()
        cell.configureWith(model: serverMessagesPresentationModels[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128
    }
    
}

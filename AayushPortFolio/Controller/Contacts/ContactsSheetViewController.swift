//
//  ContactsSheetViewController.swift
//  AayushPortFolio
//
//  Created by Aayush kumar on 21/12/23.
//

import MessageUI
import SafariServices
import AVFoundation
import UIKit
/**
 `ContactsSheetViewController` is a UIViewController subclass responsible for displaying contact information in a sheet-like interface.

 ## Properties

 - `feedbackGenerator`: A private property to provide haptic feedback when certain actions are performed.

 - `player`: An AVAudioPlayer for playing a sound effect when buttons are pressed.

 ## UI Components

 - `dismissButton`: A button to dismiss the sheet.

 - `line`: A decorative line at the top of the sheet.

 - `titlePage`: A label displaying the title of the contact sheet.

 - `phoneNumberTitle`: A label displaying the title for the phone number.

 - `callButton`: A custom button for displaying and interacting with the phone number.

 - `emailTitle`: A label displaying the title for the email address.

 - `emailButton`: A custom button for displaying and interacting with the email address.

 - `linkedinTitle`: A label displaying the title for the LinkedIn profile.

 - `linkedinButton`: A custom button for displaying and interacting with the LinkedIn profile.

 ## Lifecycle Methods

 - `viewDidLoad()`: Called after the controller's view is loaded into memory. It sets up the initial view configurations and prepares the sound effect.

 ## Configuration and Layout Methods

 - `configureLayout()`: Configures the layout of all UI components, including constraints and adaptive layout for different device sizes.

 ## Button Actions

 - `dismissButtonDidTapped()`: Dismisses the contact sheet when the dismiss button is tapped.

 - `callDidTapped()`: Shows an action sheet for options related to the phone number, such as copying or calling.

 - `emailDidTapped()`: Shows an action sheet for options related to the email address, such as copying or sending an email.

 - `linkedinDidTapped()`: Opens the LinkedIn profile in a Safari View Controller.

 ## Animations

 - `buttonPressedAnimation(button:)`: Provides a visual animation effect when a button is pressed.

 ## Sound Effects

 - `prepareSoundEffect()`: Prepares the AVAudioPlayer for the button press sound effect.

 - `soundClick()`: Plays the button press sound effect.

 */
class ContactsSheetViewController: UIViewController {
    
    //MARK: Initializer
    private var feedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
    
    private var player: AVAudioPlayer?
    
    //MARK: Objects
    @objc lazy var dismissButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Xmark20px")?.withTintColor(UIColor(named: "BlackLabels") ?? UIColor.gray), for: .normal)
        return button
    }()
    
    lazy var line: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(named: "BlackSecondary")
        line.layer.cornerRadius = 2.5
        line.clipsToBounds = true
        return line
    }()
    
    lazy var titlePage: UILabel = {
        let title = UILabel()
        title.text = "Contact me!"
        title.textColor = UIColor(named: "BlackSecondary")
        title.textAlignment = .center
        return title
    }()
    
    lazy var phoneNumberTitle: UILabel = {
        let title = UILabel()
        title.text = "Phone Number"
        title.textColor = UIColor(named: "BlackSecondary")
        title.numberOfLines = 0
        title.textAlignment = .left
        return title
    }()
    
    lazy var callButton: CustomButton = {
        let icon = UIImage(named: "Call_Ringing")?.withTintColor(UIColor(named: "BlackLabels") ?? UIColor.gray)
        
        let number = CustomButton(icon: icon!, text: "+41 76 834 86 65")
        return number
    }()
    
    lazy var emailTitle: UILabel = {
        let title = UILabel()
        title.text = "Email"
        title.textColor = UIColor(named: "BlackSecondary")
        title.font = UIFont(name: "Nunito-Bold", size: 14)
        title.numberOfLines = 0
        title.textAlignment = .left
        return title
    }()
    
    lazy var emailButton: CustomButtonAttributedText = {
        
        let icon = UIImage(named: "Envelope")?.withTintColor(UIColor(named: "BlackLabels") ?? UIColor.gray)
        
        let button = CustomButtonAttributedText(icon: icon!, text: ContactsModel.emailAddress, target: self, action: #selector(emailDidTapped))
        
        return button
    }()
    
    lazy var linkedinTitle: UILabel = {
        let title = UILabel()
        title.text = "Linkedin"
        title.textColor = UIColor(named: "BlackSecondary")
        title.font = UIFont(name: "Nunito-Bold", size: 14)
        title.numberOfLines = 0
        title.textAlignment = .left
        return title
    }()
    
    lazy var linkedinButton: CustomButtonAttributedText = {
        let icon = UIImage(named: "Linkedin")?.withTintColor(UIColor(named: "BlackLabels") ?? UIColor.gray)
        let button = CustomButtonAttributedText(icon: icon!, text: "linkedin.com/in/caio-chaves" , target: self, action: #selector(linkedinDidTapped))
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "WhiteBackground")
        configureLayout()
        prepareSoundEffect()
    }
    
    
    
    //MARK: Configuring Layout
    private func configureLayout() {
        
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        
        let backgroundSheet = UIImageView(frame: .init(x: 0, y: 0, width: width, height: height))
        backgroundSheet.image = UIImage(named: "background")
        
        let leading = view.layoutMarginsGuide.leadingAnchor
        
        let trailing = view.layoutMarginsGuide.trailingAnchor
        
        
        
        view.addSubview(backgroundSheet)
        view.sendSubviewToBack(backgroundSheet)
        view.addSubview(line)
        view.addSubview(dismissButton)
        view.addSubview(titlePage)
        view.addSubview(phoneNumberTitle)
        view.addSubview(callButton)
        view.addSubview(emailTitle)
        view.addSubview(emailButton)
        view.addSubview(linkedinTitle)
        view.addSubview(linkedinButton)

        backgroundSheet.translatesAutoresizingMaskIntoConstraints = false
        line.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        titlePage.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberTitle.translatesAutoresizingMaskIntoConstraints = false
        callButton.translatesAutoresizingMaskIntoConstraints = false
        emailTitle.translatesAutoresizingMaskIntoConstraints = false
        emailButton.translatesAutoresizingMaskIntoConstraints = false
        linkedinTitle.translatesAutoresizingMaskIntoConstraints = false
        linkedinButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            
            backgroundSheet.widthAnchor.constraint(equalTo: view.widthAnchor),
            backgroundSheet.heightAnchor.constraint(equalTo: view.heightAnchor),
            
            line.widthAnchor.constraint(equalToConstant: 35),
            line.heightAnchor.constraint(equalToConstant: 5),
            line.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            line.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            dismissButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            dismissButton.leadingAnchor.constraint(equalTo: leading),
            
            titlePage.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            titlePage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            phoneNumberTitle.topAnchor.constraint(equalTo: titlePage.bottomAnchor, constant: 20),
            phoneNumberTitle.leadingAnchor.constraint(equalTo: leading),
            
            callButton.topAnchor.constraint(equalTo: phoneNumberTitle.bottomAnchor, constant: 5),
            callButton.leadingAnchor.constraint(equalTo: leading),
            callButton.trailingAnchor.constraint(equalTo: trailing),
            
            emailTitle.topAnchor.constraint(equalTo: callButton.bottomAnchor, constant: 20),
            emailTitle.leadingAnchor.constraint(equalTo: leading),
            
            emailButton.topAnchor.constraint(equalTo: emailTitle.bottomAnchor, constant: 5),
            emailButton.leadingAnchor.constraint(equalTo: leading),
            emailButton.trailingAnchor.constraint(equalTo: trailing),
            
            linkedinTitle.topAnchor.constraint(equalTo: emailButton.bottomAnchor, constant: 20),
            linkedinTitle.leadingAnchor.constraint(equalTo: leading),
            
            linkedinButton.topAnchor.constraint(equalTo: linkedinTitle.bottomAnchor, constant: 5),
            linkedinButton.leadingAnchor.constraint(equalTo: leading),
            linkedinButton.trailingAnchor.constraint(equalTo: trailing),
            
            
            
        ])
        
        //MARK: Adaptative layout
        if DeviceType.isIphone5 || DeviceType.isIphone6or7or8 {
            
            titlePage.font = UIFont(name: "Nunito-Black", size: 25)
            
            phoneNumberTitle.font = UIFont(name: "Nunito-Bold", size: 12)
            
            emailTitle.font = UIFont(name: "Nunito-Bold", size: 12)
            
            linkedinTitle.font = UIFont(name: "Nunito-Bold", size: 12)
            
            NSLayoutConstraint.activate([
            
                dismissButton.widthAnchor.constraint(equalToConstant: 20),
                dismissButton.heightAnchor.constraint(equalToConstant: 20)
            
            ])
            
        } else {
            
            titlePage.font = UIFont(name: "Nunito-Black", size: 40)
            
            phoneNumberTitle.font = UIFont(name: "Nunito-Bold", size: 14)
            
            emailTitle.font = UIFont(name: "Nunito-Bold", size: 14)
            
            linkedinTitle.font = UIFont(name: "Nunito-Bold", size: 14)
            
        }
        
        dismissButton.addTarget(self, action: #selector(dismissButtonDidTapped), for: .touchUpInside)
        callButton.addTarget(self, action: #selector(callDidTapped), for: .touchUpInside)
        emailButton.addTarget(self, action: #selector(emailDidTapped), for: .touchUpInside)
        linkedinButton.addTarget(self, action: #selector(linkedinDidTapped), for: .touchUpInside)
    }
    
    //MARK: Buttons function
    
    //DismissButto
    @objc func dismissButtonDidTapped() {
        dismiss(animated: true)
    }
    
    
    
    @objc func callDidTapped() {
        
        feedbackGenerator.impactOccurred()
        soundClick()
        buttonPressedAnimation(button: callButton)
        
        //Creating the UIAlertController(This will represents the alert that will show up on the bottom) with title and message setted to nil
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        // Creating the action to copy the number
        let copyNumber = UIAlertAction(title: "Copy Number", style: .default) { (action) in
            
            UIPasteboard.general.string = ContactsModel.phoneNumber
            
        }
        
        //Creating the action to call to this number
        let callMe = UIAlertAction(title: "Call Me", style: .default) { (action) in
            
            if let phoneURL = URL(string: "tel://\(ContactsModel.phoneNumber)") {
                
                if  UIApplication.shared.canOpenURL(phoneURL) {
                    UIApplication.shared.open(phoneURL)
                } else {
                    print("Error to find phoneURL")
                }
            }
        }
        
        //Creating the cancel action
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        //Adding all the actions to the alert
        alert.addAction(copyNumber)
        alert.addAction(callMe)
        alert.addAction(cancel)
        
        //Presenting the alert on the view controller
        present(alert, animated: true)
    }
    
    @objc func emailDidTapped() {
        
        feedbackGenerator.impactOccurred()
        soundClick()
        buttonPressedAnimation(button: emailButton)
        
        
        //Creating the UIAlertController(This will represents the alert that will show up on the bottom) with title and message setted to nil
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        // Creating the action to copy the email
        let copyEmail = UIAlertAction(title: "Copy Email", style: .default) { (action) in
            
            UIPasteboard.general.string = ContactsModel.emailAddress
            
        }
        
        //Creating the action to send email to this email address
        let sendEmail = UIAlertAction(title: "Send Email", style: .default) { (action) in
            
            if let email = ContactsModel.emailAddress.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
                if let emailURL = URL(string: "mailTo: \(email)") {
                    
                    if UIApplication.shared.canOpenURL(emailURL) {
                        UIApplication.shared.open(emailURL)
                    } else {
                        print("Error to find emailURL")
                    }
                }
            }
        }
        
        //Creating the cancel action
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        //Adding all the actions to the alert
        alert.addAction(copyEmail)
        alert.addAction(sendEmail)
        alert.addAction(cancel)
        
        //Presenting the alert on the view controller
        present(alert, animated: true)
    }
    
    //Linkedin page
    @objc func linkedinDidTapped() {
        
        feedbackGenerator.impactOccurred()
        soundClick()
        buttonPressedAnimation(button: linkedinButton)
        
        guard let url = URL(string: ContactsModel.linkedin) else { return }
        
        let vc = SFSafariViewController(url: url)
        vc.modalPresentationStyle = .pageSheet
        present(vc, animated: true)
        
    }
    
    //MARK: Animations
    func buttonPressedAnimation(button: UIButton) {
        button.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.1, options: [.curveLinear]) {
            button.transform = .identity
        }
    }
    
    //MARK: Sound effects
    private func prepareSoundEffect() {
        guard let url = Bundle.main.url(forResource: "click", withExtension: ".wav") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.volume = 0.3
            player?.prepareToPlay()
        } catch {
            print("Error trying to prepare sound click \(error.localizedDescription)")
        }
    }
    
    private func soundClick() {
        
        if let player = player {
            if player.isPlaying {
                player.currentTime = 0
            } else {
                player.play()
            }
        }
        
    }
}

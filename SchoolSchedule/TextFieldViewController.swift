//
//  TextFieldViewController.swift
//  SchoolSchedule
//
//  Created by 箭内雄 on 2021/02/20.
//

import UIKit

class TextFieldViewController: UIViewController {
    
    var TopVC:ViewController?
    var receiveTime:String = ""
    var receiveTapedCellIndex:Int = 0
    var ownScheduleSubjectTitle = UserDefaults.standard
    var reReceiveSubject:String = ""
    var subjectTitle:String = ""
    var receiveInfo:[String] = ["","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",""]
    @IBOutlet weak var SubjectTextField: UITextField!
    @IBOutlet weak var SaveButtonOutlet: UIButton!
    
    @IBOutlet weak var TeacherNameTextField: UITextField!
    @IBOutlet weak var ClassroomTextField: UITextField!
    @IBOutlet weak var CreditValueTextField: UITextField!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        receiveInfo = ownScheduleSubjectTitle.stringArray(forKey: "Subject") ?? ["","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",""]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
   
    private func setUpViews(){
        SubjectTextField.delegate = self
        SubjectTextField.layer.cornerRadius = 8
        SubjectTextField.layer.borderWidth = 1
        SubjectTextField.text = reReceiveSubject

        navigationItem.title = receiveTime
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor:UIColor.white]
        
        TeacherNameTextField.layer.borderWidth = 1
        TeacherNameTextField.layer.cornerRadius = 8
        ClassroomTextField.layer.borderWidth = 1
        CreditValueTextField.layer.borderWidth = 1
        
        
        ClassroomTextField.layer.cornerRadius = 8
        CreditValueTextField.layer.cornerRadius = 8
        SaveButtonOutlet.layer.cornerRadius = 10
       
    }
       @IBAction func tappedBackButton(_ sender: Any) {
           self.dismiss(animated: true, completion: nil)
       }
    @IBAction func SaveButtonAction(_ sender: Any) {
        receiveInfo[receiveTapedCellIndex] = subjectTitle
        ownScheduleSubjectTitle.set(receiveInfo,forKey: "Subject")
        self.dismiss(animated: true)
    }
}

extension TextFieldViewController:UITextFieldDelegate{
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let  sub = SubjectTextField.text else {return}
        subjectTitle = sub
    }
}

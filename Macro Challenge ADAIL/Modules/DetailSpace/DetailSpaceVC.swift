//
//  DetailSpaceVC.swift
//  Macro Challenge ADAIL
//
//  Created by Sukma Risfa Sam Bima Yudha on 19/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit
import PhotosUI

class DetailSpaceVC: UIViewController {
    var presentor: DetailSpaceViewToPresenterProtocol?
    public var delegate: DetailSpaceDelegate!
    
    let imgProfile: UIImageView = {
        let imgView = UIImageView()
        let img = UIImage(named: "EmptyPP")
        imgView.image = img
        imgView.frame = CGRect(x: 0, y: 150, width: 150, height: 150)
        imgView.layer.cornerRadius = imgView.frame.width / 2
        imgView.backgroundColor = .black
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    let changeButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Change Co-Living Photo", for: .normal)
        btn.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        btn.setTitleColor(.systemBlue, for: .normal)
        return btn
    }()
    
    let textFieldBG: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        return view
    }()
    
    let nameTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Co-Living"
        lbl.textColor = .systemBlue
        lbl.font = .systemFont(ofSize: 17)
        lbl.frame = CGRect(x: 0, y: 0, width: 150, height: 50)
        return lbl
    }()
    
    let nameTxtField: UITextView = {
        let txt = UITextView()
        txt.text = "Kos Ibu Wati"
        txt.textColor = .black
        txt.font = .systemFont(ofSize: 17)
        txt.frame = CGRect(x: 0, y: 0, width: 150, height: 50)
        return txt
    }()
    
    let line: UIView = {
        let ln = UIView()
        ln.backgroundColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 1)
        return ln
    }()
    
    let addressTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Address"
        lbl.textColor = .systemBlue
        lbl.font = .systemFont(ofSize: 17)
        lbl.frame = CGRect(x: 0, y: 0, width: 150, height: 50)
        return lbl
    }()
    
    let addressTxtField: UITextView = {
        let txt = UITextView()
        txt.text = "Batam Kota, Batam Center, Legenda Malaka Blok A7/1"
        txt.textColor = .black
        txt.font = .systemFont(ofSize: 17)
        txt.frame = CGRect(x: 0, y: 0, width: 150, height: 50)
        return txt
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        navigationController?.navigationBar.prefersLargeTitles = false
        print("This is detail space vc")
        
        view.addSubview(imgProfile)
        imgProfile.center.x = view.center.x
        
        view.addSubview(changeButton)
        changeButton.translatesAutoresizingMaskIntoConstraints = false
        changeButton.topAnchor.constraint(equalTo: imgProfile.bottomAnchor, constant: 10).isActive = true
        changeButton.centerXAnchor.constraint(equalTo: imgProfile.centerXAnchor).isActive = true
        changeButton.addTarget(self, action: #selector(changePhotoTap), for: .touchUpInside)
        
        
        
        view.addSubview(textFieldBG)
        textFieldBG.translatesAutoresizingMaskIntoConstraints = false
        textFieldBG.topAnchor.constraint(equalTo: changeButton.bottomAnchor, constant: 30).isActive = true
        textFieldBG.heightAnchor.constraint(equalToConstant: 140).isActive = true
        textFieldBG.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        textFieldBG.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        
        textFieldBG.addSubview(nameTitleLabel)
        nameTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        nameTitleLabel.topAnchor.constraint(equalTo: textFieldBG.topAnchor, constant: 10).isActive = true
        nameTitleLabel.leadingAnchor.constraint(equalTo: textFieldBG.leadingAnchor, constant: 17).isActive = true
        nameTitleLabel.widthAnchor.constraint(equalToConstant: 75).isActive = true
        nameTitleLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        textFieldBG.addSubview(nameTxtField)
        nameTxtField.isEditable = true
        nameTxtField.translatesAutoresizingMaskIntoConstraints = false
        nameTxtField.topAnchor.constraint(equalTo: nameTitleLabel.topAnchor).isActive = true
        nameTxtField.leadingAnchor.constraint(equalTo: nameTitleLabel.trailingAnchor, constant: 40).isActive = true
        nameTxtField.widthAnchor.constraint(equalToConstant: 210).isActive = true
        nameTxtField.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        textFieldBG.addSubview(line)
        line.translatesAutoresizingMaskIntoConstraints = false
        line.topAnchor.constraint(equalTo: nameTxtField.bottomAnchor, constant: 10).isActive = true
        line.leadingAnchor.constraint(equalTo: textFieldBG.leadingAnchor).isActive = true
        line.trailingAnchor.constraint(equalTo: textFieldBG.trailingAnchor).isActive = true
        line.heightAnchor.constraint(equalToConstant: 0.5).isActive = true

        textFieldBG.addSubview(addressTitleLabel)
        addressTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        addressTitleLabel.topAnchor.constraint(equalTo: line.bottomAnchor, constant: 10).isActive = true
        addressTitleLabel.leadingAnchor.constraint(equalTo: textFieldBG.leadingAnchor, constant: 17).isActive = true
        addressTitleLabel.widthAnchor.constraint(equalToConstant: 75).isActive = true
        addressTitleLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        textFieldBG.addSubview(addressTxtField)
        addressTxtField.isEditable = true
        addressTxtField.translatesAutoresizingMaskIntoConstraints = false
        addressTxtField.topAnchor.constraint(equalTo: addressTitleLabel.topAnchor).isActive = true
        addressTxtField.leadingAnchor.constraint(equalTo: addressTitleLabel.trailingAnchor, constant: 40).isActive = true
        addressTxtField.widthAnchor.constraint(equalToConstant: 210).isActive = true
        addressTxtField.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc func changePhotoTap() {
        let action = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        action.addAction(UIAlertAction(title: "Remove current photo", style: .destructive, handler: { action in
            self.imgProfile.image = UIImage(named: "EmptyPP")
        }))
        
        action.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { action in
            print("Take Photo")
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .camera
            imagePicker.delegate = self
            self.present(imagePicker, animated: true, completion: nil)

        }))
        
        action.addAction(UIAlertAction(title: "Choose from library", style: .default, handler: { action in
            var pickerConfig:PHPickerConfiguration = PHPickerConfiguration()
            pickerConfig.filter = .images
            pickerConfig.selectionLimit = 1
            
            let picker:PHPickerViewController = PHPickerViewController(configuration: pickerConfig)
            picker.delegate = self
            self.present(picker, animated: true, completion: nil)
        }))
        
        action.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
        }))
        
        present(action, animated: true, completion: nil)
    }
}

extension DetailSpaceVC: DetailSpacePresenterToViewProtocol {
    
}

extension DetailSpaceVC: PHPickerViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true, completion: nil)
        for i in results {
            i.itemProvider.loadObject(ofClass: UIImage.self) { image, error in
                if let image = image as? UIImage {
                    DispatchQueue.main.async {
                        self.imgProfile.image = image
                        print("Berhasil")
                    }
                }
            }
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        imgProfile.image = image
    }
    
    
}

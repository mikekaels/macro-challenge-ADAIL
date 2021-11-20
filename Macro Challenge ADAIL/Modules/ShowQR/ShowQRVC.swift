//
//  ShowQRVC.swift
//  Macro Challenge ADAIL
//
//  Created by Sukma Risfa Sam Bima Yudha on 19/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit
import CoreImage.CIFilterBuiltins

class ShowQRVC: UIViewController {
    var presentor: ShowQRViewToPresenterProtocol?
    public var delegate: ShowQRDelegate!
    
    let nameTitle: UILabel = {
        let lbl = UILabel()
        lbl.text = "Kos Ibu Wati"
        lbl.textColor = .systemBlue
        lbl.font = .systemFont(ofSize: 28, weight: .bold)
        lbl.frame = CGRect(x: 0, y: 0, width: 300, height: 50)
        return lbl
    }()
    
    let qrBG: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 23
        return view
    }()
    
    let qrCodeImg: UIImageView = {
        let imgView = UIImageView()
        let img = UIImage()
        imgView.image = img
        return imgView
    }()
    
    let qrCodeLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "qwer6547"
        lbl.textColor = .black
        lbl.font = .systemFont(ofSize: 28, weight: .bold)
        lbl.textAlignment = .center
        return lbl
    }()
    
    //Test
    let qrCode: String = "12332122"

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "QR Code"
        print("Show QR View Controller")
        view.backgroundColor = .secondarySystemBackground
        navigationController?.navigationBar.prefersLargeTitles = false
        
        setupView()
        qrCodeLbl.text = qrCode
        qrCodeImg.image = generateQRCode(from: qrCode)

    }
    
    func setupView() {
        view.addSubview(nameTitle)
        nameTitle.translatesAutoresizingMaskIntoConstraints = false
        nameTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        nameTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(qrBG)
        qrBG.translatesAutoresizingMaskIntoConstraints = false
        qrBG.topAnchor.constraint(equalTo: nameTitle.bottomAnchor, constant: 30).isActive = true
        qrBG.heightAnchor.constraint(equalToConstant: 340).isActive = true
        qrBG.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        qrBG.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        
        qrBG.addSubview(qrCodeImg)
        qrCodeImg.translatesAutoresizingMaskIntoConstraints = false
        qrCodeImg.topAnchor.constraint(equalTo: qrBG.topAnchor, constant: 23).isActive = true
        qrCodeImg.leadingAnchor.constraint(equalTo: qrBG.leadingAnchor, constant: 55).isActive = true
        qrCodeImg.trailingAnchor.constraint(equalTo: qrBG.trailingAnchor, constant: -55).isActive = true
        qrCodeImg.bottomAnchor.constraint(equalTo: qrBG.bottomAnchor, constant: -64).isActive = true
        
        qrBG.addSubview(qrCodeLbl)
        qrCodeLbl.translatesAutoresizingMaskIntoConstraints = false
        qrCodeLbl.topAnchor.constraint(equalTo: qrCodeImg.bottomAnchor).isActive = true
        qrCodeLbl.centerXAnchor.constraint(equalTo: qrCodeImg.centerXAnchor).isActive = true
        qrCodeLbl.widthAnchor.constraint(equalToConstant: 150).isActive = true
        qrCodeLbl.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
    }
    
    func generateQRCode(from: String) -> UIImage? {
        let data = from.data(using: String.Encoding.ascii)
        
        guard let qrFilter = CIFilter(name: "CIQRCodeGenerator") else { return nil }
        qrFilter.setValue(data, forKey: "inputMessage")
    
        guard let qrImage = qrFilter.outputImage else { return nil }
        let transform = CGAffineTransform(scaleX: 10, y: 10)
        let scaledQrImage = qrImage.transformed(by: transform)
        let context = CIContext()
        
        guard let cgImage = context.createCGImage(scaledQrImage, from: scaledQrImage.extent) else { return nil }
        let processedImage = UIImage(cgImage: cgImage)
        
        return processedImage
    }
}

extension ShowQRVC: ShowQRPresenterToViewProtocol {
    
}

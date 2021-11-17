//
//  JoinSpaceVC.swift
//  Macro Challenge ADAIL
//
//  Created by Sukma Risfa Sam Bima Yudha on 16/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit
import AVFoundation
import SwiftUI

class JoinSpaceVC: UIViewController {
    var presentor: JoinSpaceViewToPresenterProtocol?
    public var delegate: JoinSpaceDelegate!
    
    var captureSession = AVCaptureSession()
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    var qrCodeFrameView: UIView?
    var qrValue = false
    
    let cameraView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    let messageLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "No QRCode is detected"
        lbl.textAlignment = .center
        lbl.textColor = .white
        lbl.backgroundColor = .secondarySystemFill
        return lbl
    }()
    
    let captureButton: UIButton = {
        let btn = UIButton()
        let img = UIImage(named: "CameraShut")
        btn.setImage(img, for: .normal)
        btn.contentMode = .scaleAspectFit
        return btn
    }()
    
    let cancelButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Cancel", for: .normal)
        btn.setTitleColor(UIColor.systemBlue, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 17)
        btn.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        return btn
    }()
    
    let flashButton: UIButton = {
        let btn = UIButton()
        let size = UIImage.SymbolConfiguration(pointSize: 30, weight: .light)
        let img = UIImage(systemName: "bolt.slash", withConfiguration: size)
        btn.setImage(img, for: .normal)
        btn.contentMode = .scaleAspectFit
        return btn
    }()
    
    let captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = .secondarySystemBackground
        self.tabBarController?.tabBar.isHidden = true
        
        setCameraView()
        setButton()
    }
    
    func setCameraView() {
        view.addSubview(cameraView)
        cameraView.frame = CGRect(x: view.frame.minX, y: view.frame.minY, width: view.frame.width, height: 550)
        cameraView.addSubview(messageLabel)
        messageLabel.frame = CGRect(x: cameraView.frame.midX - 100, y: cameraView.frame.maxY - 50, width: 200, height: 50)
        cameraConfig()
    }
    
    func cameraConfig() {
        guard let captureDevice = captureDevice else {
            return
        }

        
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice)
            
            captureSession.addInput(input)
            
            let captureMetaDataOutput = AVCaptureMetadataOutput()
            captureSession.addOutput(captureMetaDataOutput)

            captureMetaDataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            captureMetaDataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
            
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
            videoPreviewLayer?.frame = cameraView.bounds
            cameraView.layer.addSublayer(videoPreviewLayer!)

            captureSession.startRunning()
            
            qrCodeFrameView = UIView()
            if let qrCodeFrameView = qrCodeFrameView {
                qrCodeFrameView.layer.borderColor = UIColor.systemYellow.cgColor
                qrCodeFrameView.layer.borderWidth = 2
                cameraView.addSubview(qrCodeFrameView)
                cameraView.bringSubviewToFront(qrCodeFrameView)
            }
            
        } catch {
            print(error)
            return
        }
    }
    
    func setButton() {
        view.addSubview(captureButton)
        captureButton.translatesAutoresizingMaskIntoConstraints = false
        captureButton.topAnchor.constraint(equalTo: cameraView.bottomAnchor, constant: 60).isActive = true
        captureButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        captureButton.addTarget(self, action: #selector(captureButtonTap), for: .touchUpInside)

        
        view.addSubview(cancelButton)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.centerYAnchor.constraint(equalTo: captureButton.centerYAnchor).isActive = true
        cancelButton.trailingAnchor.constraint(equalTo: captureButton.leadingAnchor, constant: -25).isActive = true
        cancelButton.addTarget(self, action: #selector(cancelButtonTap), for: .touchUpInside)

        view.addSubview(flashButton)
        flashButton.translatesAutoresizingMaskIntoConstraints = false
        flashButton.centerYAnchor.constraint(equalTo: captureButton.centerYAnchor).isActive = true
        flashButton.leadingAnchor.constraint(equalTo: captureButton.trailingAnchor, constant: 30).isActive = true
        flashButton.addTarget(self, action: #selector(flashButtonTap), for: .touchUpInside)
    }
    
    @objc func captureButtonTap() {
        if !(qrValue) {
            captureSession.stopRunning()
            qrCodeFrameView?.frame = CGRect.zero
            messageLabel.text = "No QRCode is detected"
            cameraView.bringSubviewToFront(messageLabel)
            qrValue = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.captureSession.startRunning()
                self.cameraView.sendSubviewToBack(self.messageLabel)
            }
            
        } else {
            self.cameraView.bringSubviewToFront(self.messageLabel)
            self.qrValue = true
            captureSession.stopRunning()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.presentor?.router?.backToProfile(from: self)
            }
        }
    }
    
    @objc func cancelButtonTap() {
        captureSession.stopRunning()
        self.presentor?.router?.backToProfile(from: self)
    }
    
    @objc func flashButtonTap() {
        guard let captureDevice = captureDevice else {
            return
        }
        let size = UIImage.SymbolConfiguration(pointSize: 30, weight: .light)
        let imgOn = UIImage(systemName: "bolt", withConfiguration: size)
        let imgOff = UIImage(systemName: "bolt.slash", withConfiguration: size)
        
        captureDevice.unlockForConfiguration()
        
        do {
            try captureDevice.lockForConfiguration()
            captureDevice.torchMode = captureDevice.torchMode == .on ? .off : .on
            captureDevice.unlockForConfiguration()
            if captureDevice.torchMode == .off {
                flashButton.setImage(imgOff, for: .normal)
            } else {
                flashButton.setImage(imgOn, for: .normal)
            }
        } catch {
            print(error)
        }
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if metadataObjects.count == 0 {
            qrCodeFrameView?.frame = CGRect.zero
            cameraView.sendSubviewToBack(messageLabel)
            qrValue = false
            return
        }
        
        let metaDataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        
        if metaDataObj.type == AVMetadataObject.ObjectType.qr {
            let barCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metaDataObj)
            qrCodeFrameView?.frame = barCodeObject!.bounds
            
            if metaDataObj.stringValue != nil {
                messageLabel.text = metaDataObj.stringValue
                qrValue = true
            }
        }
    }
    
}

extension JoinSpaceVC: JoinSpacePresenterToViewProtocol {
    
}

extension JoinSpaceVC: AVCaptureMetadataOutputObjectsDelegate {
    
}

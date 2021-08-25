// Copyright 2019 The TensorFlow Authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import UIKit
import AVFoundation

/**
 Displays a preview of the image being processed. By default, this uses the device's camera frame,
 but will use a still image copied from clipboard if `shouldUseClipboardImage` is set to true.
 */


@objc(TFImageClassification)
class TFImageClassification : RCTViewManager {
    
    
     var sendDataCallback: RCTResponseSenderBlock?

    @objc func startCapture() {
        print("start Capture")
        cameraCapture.checkCameraConfigurationAndStartSession()
    }
    
    @objc func stopCapture() {
        print("stop Capture")
        cameraCapture.stopSession()
    }
    
    private var eventEmitter: ReactNativeEventEmitter!
    private let delayBetweenInferencesMs: Double = 1000
    private var previousInferenceTimeMs: TimeInterval = Date.distantPast.timeIntervalSince1970 * 1000

    private var inferenceViewController: InferenceViewController?
    var previewView: PreviewView! = PreviewView();
    private lazy var cameraCapture = CameraFeedManager(previewView: previewView);


    private var modelDataHandler: ModelDataHandler? =
      ModelDataHandler(modelFileInfo: MobileNet.modelInfo, labelsFileInfo: MobileNet.labelsInfo)
        
    private var result: Result?
    
  override func view() -> UIView! {
    cameraCapture.delegate = self
    
    return previewView
  }
}


extension TFImageClassification: CameraFeedManagerDelegate {
    func presentCameraPermissionsDeniedAlert() {
        
        
    }
    
    func presentVideoConfigurationErrorAlert() {
        
        
    }
    
    func sessionRunTimeErrorOccured() {
        
        
    }
    
    func sessionWasInterrupted(canResumeManually resumeManually: Bool) {
        
        
    }
    
    func sessionInterruptionEnded() {
        
        
    }
    
    func didOutput(pixelBuffer: CVPixelBuffer) {
      let currentTimeMs = Date().timeIntervalSince1970 * 1000
      guard (currentTimeMs - previousInferenceTimeMs) >= delayBetweenInferencesMs else { return }
      previousInferenceTimeMs = currentTimeMs
      result = modelDataHandler?.runModel(onFrame: pixelBuffer)
        let jsonEncoder = JSONEncoder()
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        do {
            let data = try encoder.encode(result!.inferences)
            EventEmitter.sharedInstance.dispatch(name: "TFImageClassification", body:String(data: data, encoding: .utf8))
        } catch {
            print(error)
        }
    }
}




class PreviewView: UIView {
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.addSubview(imageView)
  }
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
    lazy private var imageView: UIImageView = {
      let imageView = UIImageView()
      imageView.contentMode = .scaleAspectFill
      imageView.translatesAutoresizingMaskIntoConstraints = false
      return imageView
    }()

    var image: UIImage? {
      get {
        return imageView.image
      }
      set {
        imageView.image = newValue
      }
    }

    var previewLayer: AVCaptureVideoPreviewLayer {
      guard let layer = layer as? AVCaptureVideoPreviewLayer else {
        fatalError("Layer expected is of type VideoPreviewLayer")
      }
      return layer
    }
    
    
    var session: AVCaptureSession? {
      get {
        return previewLayer.session
      }
      set {
        previewLayer.session = newValue
      }
    }
    
    override class var layerClass: AnyClass {
      print("leonid rulse!")
      return AVCaptureVideoPreviewLayer.self
    }
    
}

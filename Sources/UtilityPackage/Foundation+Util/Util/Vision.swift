//
//  File.swift
//  
//
//  Created by Vaibhav kumar on 12/29/21.
//

import Foundation
import Vision

public class VisionScan {
    public class func recognizeText(from images: [CGImage], completion: ((String) -> ())?) {
        var entireRecognizedText = ""
        
        let recognizeTextRequest = VNRecognizeTextRequest { (request, error) in
            guard error == nil else { return }
            
            guard let observations = request.results as? [VNRecognizedTextObservation] else { return }
            
            let maximumRecognitionCandidates = 1
            for observation in observations {
                guard let candidate = observation.topCandidates(maximumRecognitionCandidates).first else { continue }
                
                entireRecognizedText += "\(candidate.string)\n"
            }
            completion?(entireRecognizedText)
        }
        recognizeTextRequest.recognitionLevel = .accurate
        
        for image in images {
            let requestHandler = VNImageRequestHandler(cgImage: image, options: [:])
            try? requestHandler.perform([recognizeTextRequest])
        }
    }
}

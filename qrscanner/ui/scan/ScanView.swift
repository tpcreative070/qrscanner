//
//  ScanView.swift
//  qrscanner
//
//  Created by phong on 21/11/2023.
//

import Foundation
import SwiftUI
import AVFoundation

struct cameraFrame: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let width = rect.width
            let height = rect.height
            
            path.addLines( [
                
                CGPoint(x: 0, y: height * 0.25),
                CGPoint(x: 0, y: 0),
                CGPoint(x:width * 0.25, y:0)
            ])
            
            path.addLines( [
                
                CGPoint(x: width * 0.75, y: 0),
                CGPoint(x: width, y: 0),
                CGPoint(x:width, y:height * 0.25)
            ])
            
            path.addLines( [
                
                CGPoint(x: width, y: height * 0.75),
                CGPoint(x: width, y: height),
                CGPoint(x:width * 0.75, y: height)
            ])
            
            path.addLines( [
                
                CGPoint(x:width * 0.25, y: height),
                CGPoint(x:0, y: height),
                CGPoint(x:0, y:height * 0.75)
                
            ])
            
        }
    }
}


struct ScanView : View {
    @State var barcodeValue = ""
    @State var torchIsOn = false
    @State var showingAlert = false
    @State var cameraPosition = AVCaptureDevice.Position.back
    
    var body: some View {
        VStack {
            
            CBScanner(
                supportBarcode: .constant([.qr, .code128]), //Set type of barcode you want to scan
                scanInterval: .constant(5.0) //Event will trigger every 5 seconds
            ){
                //When the scanner found a barcode
                print("BarCodeType =",$0.type.rawValue, "Value =",$0.value)
                barcodeValue = $0.value
            }
        onDraw: {
            print("Preview View Size = \($0.cameraPreviewView.bounds)")
            print("Barcode Corners = \($0.corners)")
            
            //line width
            let lineWidth = 2
            
            //line color
            let lineColor = UIColor.green
            
            //Fill color with opacity
            //You also can use UIColor.clear if you don't want to draw fill color
            let fillColor = UIColor(red: 0, green: 1, blue: 0.2, alpha: 0.4)
            
            //Draw box
            $0.draw(lineWidth: CGFloat(lineWidth), lineColor: lineColor, fillColor: fillColor)
        }
        .overlay(cameraFrame()
            .stroke(lineWidth: 3)
            .frame(width: 250, height: 250)
            .foregroundColor(.green))
            
        .overlay {
            VStack {
                Text(barcodeValue)
            }
        }
        }.alert(isPresented: $showingAlert) {
            Alert(title: Text("Found Barcode"), message: Text("\(barcodeValue)"), dismissButton: .default(Text("Close")))
        }
    }
}
#Preview {
    ScanView()
}

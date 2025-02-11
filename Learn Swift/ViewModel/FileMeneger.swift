//
//  MainFileMeneger.swift
//  Learn Swift
//
//  Created by Haidarov N on 1/30/25.
//

import Foundation

public class FileMeneger{
    public static let shared = FileMeneger()
    
    func getDataAsArray(_ name: String)->([String]){
        var data = [String]()
      
        if let startWordsURL = Bundle.main.url(forResource: name, withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                data = startWords.components(separatedBy: "\n")
            }
        }
        return data
    }
    
    func getData(_ name: String)->String{
        var data = ""
      
        if let dataURL = Bundle.main.url(forResource: name, withExtension: "txt") {
            if let dataWords = try? String(contentsOf: dataURL) {
                data = dataWords
            }
        }
        return data
    }
    
    func getHTMLData(_ name: String)->(URL?, URL?){
        if let filePath = Bundle.main.path(forResource: name, ofType: "html") {
            let fileURL = URL(fileURLWithPath: filePath)
            let dirURL = fileURL.deletingLastPathComponent()
            return (fileURL, dirURL)
        }else{
            return (nil, nil)
        }
    }
    

    func cssFile(){
        
    }
}

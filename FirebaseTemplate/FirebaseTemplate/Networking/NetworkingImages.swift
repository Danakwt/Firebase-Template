
import Foundation

import FirebaseStorage
import FirebaseFirestore
import UIKit 
extension Networking
{
    static func uploadImage(path: String, imageName: String, image: UIImage, success: @escaping ()->())
    {
        let imageName = imageName + ".png"
        guard let imageData = image.pngData() else {return}
        let ref = Storage.storage().reference()
        let imageRef = ref.child(path).child(imageName)
        imageRef.putData(imageData, metadata: .none) { (storageMetaData, error) in
            guard error == nil else {
                print("🔥 ERROR WHILE UPLOADING IMAGE")
                return
            }
            DispatchQueue.main.async{
                success()
            }
        }
    }
    
    static func downloadImage(path: String, success: @escaping (UIImage)-> ()){
        Storage.storage().reference(withPath: path).getData(maxSize: 100000000) { (data, error) in
            guard error == nil else {
                print("***Couldn't download image because of error \(error!)")
                return
            }
            guard let data = data else {
                print("**** Data is not found ")
                return
            }
            guard let image = UIImage(data: data) else{
                print("**** Couldn't convert data to image")
                return
            }
            success(image)
        }
    }
}

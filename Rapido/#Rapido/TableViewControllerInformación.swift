//
//  TableViewControllerInformación.swift
//  #Rapido
//
//  Created by Laboratorio UNAM-Apple 01 on 10/10/19.
//  Copyright © 2019 ari. All rights reserved.
//

import UIKit
import CoreData

struct Directorio {
    
    var image : UIImage
    var nombre : String
    var numero : String
    var direccion : String
    
}

class TableViewControllerInformacio_n: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var directorio : [Directorio] = [Directorio]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        directorio.append(Directorio.init(image: UIImage.init(named: "local")!, nombre: "Tintorería Clean Max", numero: "5527475087", direccion: "Calle Elisa 78, Nativitas"))
        
        directorio.append(Directorio.init(image: UIImage.init(named: "local")!, nombre: "Farmacia San Diego", numero: "36787654", direccion: "Justina 690, Nativitas"))
        
        directorio.append(Directorio.init(image: UIImage.init(named: "local")!, nombre: "La Corona", numero: "5587235630", direccion: "Av. Miravalle 14, Portales"))
        
        directorio.append(Directorio.init(image: UIImage.init(named: "local")!, nombre: "Veterinaria San Patricio", numero: "47893247", direccion: "Av. Lago 34, Nativitas"))
        
        directorio.append(Directorio.init(image: UIImage.init(named: "local")!, nombre: "Papeleria DABO", numero: "63234506", direccion: "Calz. Tlalpan 1406, Portales"))
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return directorio.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellInformacion", for: indexPath) as? TableViewCellInformacio_n
        
        let direccciones = directorio[indexPath.row]
        
        cell?.labelNombre.text = direccciones.nombre
        cell?.labelNumero.text = direccciones.numero
        cell?.labelDireccion.text = direccciones.direccion
        cell?.imageFoto.image = direccciones.image
        
        return cell!
        
    }
    
    
    @IBAction func agregarFoto(_ sender: Any) {
        
        
        let imagePickerController = UIImagePickerController()
        
        imagePickerController.delegate = self
        
        let actionSheet = UIAlertController(title: "De donde quieras escoger", message: "selecciona bien", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Cámara", style: .default, handler: {(action: UIAlertAction)
            in
            
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                
                imagePickerController.sourceType = .camera
                
                self.present(imagePickerController, animated: true, completion: nil)
                
            } else {
                
                print("Cámara no disponible")
            }
            
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Galerìa de fotos", style: .default, handler: {(action: UIAlertAction)
            in
            
            imagePickerController.sourceType = .photoLibrary
            
            self.present(imagePickerController, animated: true, completion: nil)
            
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        
        
        self.present(actionSheet, animated: true, completion: nil)
      
    }
    
    //Funciones del ImagePicker Controller
    func imagePickerController(_ _picker: UIImagePickerController, didFinishPickingMediaWithInfo info  : [UIImagePickerController.InfoKey : Any]) {
        
        let imageTaked = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        
        //imageFoto.image = imageTaked
        dismiss(animated: true, completion: nil)
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func guadarFoto(_ sender: UIButton) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let imageEntity = NSEntityDescription.entity(forEntityName: "Image", in: context)
        let newImage = NSManagedObject(entity: imageEntity!, insertInto: context)
        
        /*
        if let imageTmp = imageFoto.image {
            
            let imageSelected = imageTmp.pngData() as NSData?
            newImage.setValue(imageSelected, forKey: "image")
            
        }
 
 */

        do {
            
            try context.save()
            //alert print label
        } catch _ as NSError {
            
            print("Que pasoooo???")
            
            
        }
        
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

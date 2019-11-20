//
//  ViewController.swift
//  #Rapido
//
//  Created by Laboratorio UNAM-Apple 01 on 10/10/19.
//  Copyright © 2019 ari. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var negocios : [Negocio] = []
    
    @IBOutlet weak var nombreTextField: UITextField!
    
    @IBOutlet weak var telefonoTextField: UITextField!
    
    @IBOutlet weak var direccionTextField: UITextField!
    
    // @IBOutlet weak var imageContacto: UIImageView!
    
    
    @IBOutlet weak var botonRedondo: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        botonRedondo.layer.cornerRadius = 10.0
        botonRedondo.layer.masksToBounds = true
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        
        recoverData()
        
    }

    @IBAction func agregarBoton(_ sender: UIButton) {
        
        guard let nombre = nombreTextField.text, let telefono = telefonoTextField.text, let direccion = direccionTextField.text else {
            return
        }
        save(nombre: nombre, telefono: Int(telefono)!, direccion: direccion)
        performSegue(withIdentifier: "unwindToMenu", sender: self)
        
    }
    
    
    /*
    @IBAction func agregarFotoContacto(_ sender: Any) {
        
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
    
    
    func imagePickerController(_ _picker: UIImagePickerController, didFinishPickingMediaWithInfo info  : [UIImagePickerController.InfoKey : Any]) {
        
        let imageTaked = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        
        //imageContacto.image = imageTaked
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    
    
    @IBAction func guardarFoto(_ sender: UIButton) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let imageEntity = NSEntityDescription.entity(forEntityName: "Image", in: context)
        let newImage = NSManagedObject(entity: imageEntity!, insertInto: context)
        
        if let imageTmp = imageContacto.image {
            
            let imageSelected = imageTmp.pngData() as NSData?
            newImage.setValue(imageSelected, forKey: "image")
            
        }
        
        //newImage.setValue(textFieldImage.text, forKey: "title")
        
        do {
            
            try context.save()
            //alert print label
        } catch _ as NSError {
            
            print("Que pasoooo???")
            
            
        }
        
        
        
    }
 
 */

    func connection() -> NSManagedObjectContext {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        return delegate.persistentContainer.viewContext
    }
    
    func recoverData(){
        
        let context = connection()
        let fetchRequest : NSFetchRequest<Negocio> = Negocio.fetchRequest()
        
        do {
            negocios = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print("Error al recuperar los datos.", error)
        }
    }
    
    func save(nombre: String, telefono: Int, direccion : String) {
        let context = connection()
        let entityNegocio = NSEntityDescription.entity(forEntityName: "Negocio", in: context)!
        
        let negocio = NSManagedObject(entity: entityNegocio, insertInto: context)
        negocio.setValue(nombre, forKeyPath: "nombre")
        negocio.setValue(telefono, forKey: "telefono")
        negocio.setValue(direccion, forKey: "direccion")
        
        do {
            try context.save()
        } catch let error as NSError {
            print("Error al guardar. \(error), \(error.userInfo)")
        }
    }
    
}


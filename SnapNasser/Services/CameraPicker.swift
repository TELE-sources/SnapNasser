import SwiftUI
import UIKit

/// Appareil photo de l'iPhone, présenté depuis SwiftUI.
/// La photo prise est renvoyée par `onPhoto` ; `onAnnuler` si l'élève ferme la caméra.
struct CameraPicker: UIViewControllerRepresentable {
    let onPhoto: (UIImage) -> Void
    let onAnnuler: () -> Void

    func makeCoordinator() -> Coordinateur {
        Coordinateur(onPhoto: onPhoto, onAnnuler: onAnnuler)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    final class Coordinateur: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let onPhoto: (UIImage) -> Void
        let onAnnuler: () -> Void

        init(onPhoto: @escaping (UIImage) -> Void, onAnnuler: @escaping () -> Void) {
            self.onPhoto = onPhoto
            self.onAnnuler = onAnnuler
        }

        func imagePickerController(
            _ picker: UIImagePickerController,
            didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]
        ) {
            if let image = info[.originalImage] as? UIImage {
                onPhoto(image)
            } else {
                onAnnuler()
            }
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            onAnnuler()
        }
    }

    /// Vrai si cet iPhone a un appareil photo (faux dans le simulateur).
    static var disponible: Bool {
        UIImagePickerController.isSourceTypeAvailable(.camera)
    }
}

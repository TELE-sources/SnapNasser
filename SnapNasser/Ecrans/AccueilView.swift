import PhotosUI
import SwiftUI

/// Écran d'accueil : logo, accroche et bouton photo.
struct AccueilView: View {
    @State private var choixAffiche = false
    @State private var cameraAffichee = false
    @State private var galerieAffichee = false
    @State private var choixGalerie: PhotosPickerItem?
    @State private var photoPrise: UIImage?
    @State private var photoAValider: UIImage?

    var body: some View {
        ZStack {
            Theme.fond.ignoresSafeArea()

            VStack(spacing: 32) {
                Spacer()

                VStack(spacing: 12) {
                    Image(systemName: "doc.text.magnifyingglass")
                        .font(.system(size: 56))
                        .foregroundStyle(Theme.orange)
                        .accessibilityHidden(true)

                    Text("SnapNasser")
                        .font(Theme.titre())
                        .foregroundStyle(Theme.orange)

                    Text("Prends en photo ton exercice,\net découvre la solution étape par étape.")
                        .font(Theme.corps())
                        .multilineTextAlignment(.center)
                        .foregroundStyle(Theme.texte)
                        .padding(.horizontal, 24)
                }

                Spacer()

                Button {
                    choixAffiche = true
                } label: {
                    Image(systemName: "camera.fill")
                        .font(.system(size: 52))
                        .foregroundStyle(.white)
                        .frame(width: 160, height: 160)
                        .background(Circle().fill(Theme.orange))
                        .shadow(color: Theme.orange.opacity(0.3), radius: 12, y: 6)
                }
                .accessibilityLabel("Prendre en photo un exercice")

                Spacer()
            }
            .padding()
        }
        .confirmationDialog("Photo de l'exercice", isPresented: $choixAffiche, titleVisibility: .visible) {
            Button("Prendre une photo") {
                cameraAffichee = true
            }
            .disabled(!CameraPicker.disponible)

            Button("Choisir dans la galerie") {
                galerieAffichee = true
            }

            Button("Annuler", role: .cancel) {}
        }
        .fullScreenCover(isPresented: $cameraAffichee, onDismiss: {
            // La photo est transmise seulement après la fermeture de la caméra.
            if let photo = photoPrise {
                photoAValider = photo
                photoPrise = nil
            }
        }) {
            CameraPicker(
                onPhoto: { image in
                    photoPrise = image
                    cameraAffichee = false
                },
                onAnnuler: {
                    cameraAffichee = false
                }
            )
            .ignoresSafeArea()
        }
        .photosPicker(isPresented: $galerieAffichee, selection: $choixGalerie, matching: .images)
        .onChange(of: choixGalerie) { _, element in
            guard let element else { return }
            Task {
                if let donnees = try? await element.loadTransferable(type: Data.self),
                   let image = UIImage(data: donnees) {
                    photoAValider = image
                }
                choixGalerie = nil
            }
        }
        .fullScreenCover(isPresented: Binding(
            get: { photoAValider != nil },
            set: { if !$0 { photoAValider = nil } }
        )) {
            if let image = photoAValider {
                ValidationPhotoView(
                    image: image,
                    onReprendre: {
                        photoAValider = nil
                        choixAffiche = true
                    },
                    // Lecture du texte : Milestone 3. Pour l'instant on ferme l'écran.
                    onValider: {
                        photoAValider = nil
                    }
                )
            }
        }
    }
}

#Preview {
    AccueilView()
}

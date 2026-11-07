import SwiftUI

/// Écran de validation : l'élève vérifie la photo avant de la faire lire.
struct ValidationPhotoView: View {
    let image: UIImage
    let onReprendre: () -> Void
    let onValider: () -> Void

    var body: some View {
        VStack(spacing: 24) {
                Text("Ta photo")
                    .font(Theme.sousTitre())
                    .foregroundStyle(Theme.texte)
                    .padding(.top, 8)

                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .shadow(color: .black.opacity(0.1), radius: 8, y: 4)
                    .accessibilityLabel("Photo de l'exercice")

                Text("Vérifie que l'exercice est bien visible et net.")
                    .font(Theme.corps())
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Theme.texte)
                    .padding(.horizontal, 24)

                Spacer()

                HStack(spacing: 12) {
                    Button("Reprendre", action: onReprendre)
                        .font(.system(.headline, design: .rounded).weight(.semibold))
                        .lineLimit(1)
                        .minimumScaleFactor(0.7)
                        .foregroundStyle(Theme.orange)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Theme.orange, lineWidth: 2)
                        )

                    Button("Utiliser cette photo", action: onValider)
                        .font(.system(.headline, design: .rounded).weight(.semibold))
                        .lineLimit(1)
                        .minimumScaleFactor(0.7)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(
                            RoundedRectangle(cornerRadius: 14)
                                .fill(Theme.orange)
                        )
                }
            }
            .padding()
        .background(Theme.fond.ignoresSafeArea())
    }
}

#Preview {
    ValidationPhotoView(
        image: UIImage(systemName: "doc.text") ?? UIImage(),
        onReprendre: {},
        onValider: {}
    )
}

import SwiftUI

/// Écran d'accueil : logo, accroche et bouton photo.
struct AccueilView: View {
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
                    // Action de la prise de photo : Milestone 2.
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
    }
}

#Preview {
    AccueilView()
}

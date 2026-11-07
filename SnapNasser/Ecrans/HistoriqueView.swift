import SwiftUI

/// Écran d'historique : vide pour l'instant, avec un message d'accueil.
struct HistoriqueView: View {
    var body: some View {
        ZStack {
            Theme.fond.ignoresSafeArea()

            VStack(spacing: 16) {
                Image(systemName: "clock.arrow.circlepath")
                    .font(.system(size: 56))
                    .foregroundStyle(Theme.orange)
                    .accessibilityHidden(true)

                Text("Pas encore d'exercice")
                    .font(Theme.sousTitre())
                    .foregroundStyle(Theme.texte)

                Text("Les exercices que tu photographies apparaîtront ici, avec leur solution.")
                    .font(Theme.corps())
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Theme.texte)
                    .padding(.horizontal, 32)
            }
            .padding()
        }
    }
}

#Preview {
    HistoriqueView()
}

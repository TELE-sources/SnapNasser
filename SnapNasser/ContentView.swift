import SwiftUI

/// Racine de l'appli : barre d'onglets Accueil et Historique.
struct ContentView: View {
    var body: some View {
        TabView {
            AccueilView()
                .tabItem {
                    Label("Accueil", systemImage: "house.fill")
                }

            HistoriqueView()
                .tabItem {
                    Label("Historique", systemImage: "clock.fill")
                }
        }
        .tint(Theme.orange)
    }
}

#Preview {
    ContentView()
}

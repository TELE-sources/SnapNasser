import SwiftUI

/// Couleurs et polices de SnapNasser. Source unique pour l'apparence de l'appli.
enum Theme {
    // MARK: - Couleurs

    /// Orange chaud : bouton photo, titres, numéros d'étapes, réponse finale.
    static let orange = Color(red: 0.91, green: 0.45, blue: 0.10)

    /// Fond crème très clair.
    static let fond = Color(red: 1.00, green: 0.98, blue: 0.94)

    /// Brun foncé : texte principal (jamais noir pur).
    static let texte = Color(red: 0.24, green: 0.16, blue: 0.11)

    // MARK: - Polices (police système, sans bibliothèque externe)

    static func titre() -> Font {
        .system(.largeTitle, design: .rounded).weight(.bold)
    }

    static func sousTitre() -> Font {
        .system(.title3, design: .rounded).weight(.semibold)
    }

    static func corps() -> Font {
        .system(.body, design: .rounded)
    }
}

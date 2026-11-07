# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**SnapNasser** — iPhone app (Swift/SwiftUI) for Tunisian 3rd year secondary students (Sciences expérimentales). Students photograph math, physics-chemistry, or SVT exercises; the app reads the text via Apple Vision, sends it to a Cloudflare Worker (which calls Claude API), and displays step-by-step solutions.

**Stack**: Swift, SwiftUI, Vision, SwiftData | Cloudflare Worker (TypeScript) | Claude API

## Repository Structure

```
SnapNasser/
├── README.md
├── todo.md                    # Milestones & tasks (source of truth)
├── .claude/
│   └── skills/
│       ├── milestone/         # /milestone command
│       ├── programme-tunisien/ # Tunisian curriculum rules
│       ├── swiftui-snapnasser/ # iOS app conventions
│       ├── worker-snapnasser/  # Cloudflare Worker conventions
│       ├── tests-snapnasser/   # Testing methodology
│       └── publication-snapnasser/ # TestFlight/App Store
├── SnapNasser/                # Xcode project (to be created)
└── worker/                    # Cloudflare Worker (to be created)
```

## Development Commands

### iOS App (from `SnapNasser/` directory)
```bash
# Open in Xcode
open SnapNasser.xcodeproj

# Build & test from CLI
xcodebuild -project SnapNasser.xcodeproj -scheme SnapNasser -destination 'platform=iOS Simulator,name=iPhone 16' build test

# Run on simulator
xcodebuild -project SnapNasser.xcodeproj -scheme SnapNasser -destination 'platform=iOS Simulator,name=iPhone 16' run
```

### Cloudflare Worker (from `worker/` directory)
```bash
# Install dependencies
npm install

# Local development
npx wrangler dev

# Deploy (after setting secret)
npx wrangler secret put ANTHROPIC_API_KEY
npx wrangler deploy

# Test with curl
curl -X POST https://<worker-url> \
  -H "Content-Type: application/json" \
  -d '{"texte": "Résoudre 2x + 3 = 7", "appareil": "test-123"}'
```

### Git Workflow
```bash
# Milestone commit format
git commit -m "milestone N : titre du milestone"
```

## Milestone Workflow (`/milestone`)

The project advances via **milestones** (defined in `todo.md`). Run `/milestone` or `/milestone N` to execute the next one.

**Loop** (automated by the `milestone` skill):
1. Read `todo.md` → find first incomplete milestone
2. Plan (5 lines max): what + files to create/modify
3. Implement tasks in order, **no cross-milestone work**
4. Verify: compile → auto tests → simulator → **tick tasks immediately on success**
5. Fix failures (max 3 attempts, then stop)
6. Validate: update `todo.md`, update `README.md` if changed, commit
7. **Stop** — wait for user approval before next milestone

## Code Conventions (from `swiftui-snapnasser` skill)

### Design System
- **Theme.swift** — single source for all colors/fonts
- Orange chaud: photo button, titles, step numbers, subject badge, final answer box
- Fond: crème très clair
- Texte: brun foncé (never pure black)
- Rounded corners, generous spacing, simple cards

### Architecture
- 1 file per screen, small readable views
- Separate: Views | Models | Services (Vision, Worker API)
- All user-facing text in French, grouped for easy changes
- Clear error messages for students: no connection, daily limit reached, unreadable text
- SwiftUI previews with mock data for every screen
- Accessibility: dynamic type, contrast, VoiceOver labels

### Security
- **Never** API key in app or Git
- App only talks to Worker
- Camera/gallery permissions with French messages, used only for exercises

## Worker Conventions (from `worker-snapnasser` skill)

### API Contract
**Input**:
```json
{ "texte": "...", "image": "base64 (optional)", "appareil": "anonymous-id" }
```

**Output** (strict JSON):
```json
{
  "matiere": "maths | physique-chimie | svt",
  "etapes": [{ "titre": "...", "explication": "...", "regle": "..." }],
  "reponse_finale": "Phrase avec unité si besoin"
}
```

### Security
- API key in Worker secrets (`wrangler secret put`)
- Model name as config variable
- Limit image/text size
- No photo storage on server

### Daily Limit
- 10 requests/day per anonymous device ID via Cloudflare KV/Durable Objects
- Returns `limite_atteinte` error after limit

## Testing Methodology (from `tests-snapnasser` skill)

**4 Levels** — every task must pass all relevant levels:
1. **Compilation** — no errors/warnings
2. **Auto tests** — logic: JSON decode, daily limit, history storage, subject filter
3. **Simulator** — navigate milestone screen, verify "Validé quand" criteria
4. **Real iPhone** — required for camera/Vision testing

**Test Exercises** — maintain `tests/exercices/` with 5+ real exercises per subject from Tunisian textbooks.

**Key Cases**: no internet, daily limit (11th request), empty/unreadable text, invalid AI response, no API key leakage.

## Curriculum Rules (from `programme-tunisien` skill)

- **Audience**: 16-17 year olds, Sciences expérimentales, Tunisia
- **Language**: Clear French, short sentences, school vocabulary, supportive tone
- **Structure**: Identify subject → short steps (title, explanation, rule/law) → final answer with units
- **Math**: Justify with theorems, write like homework (hypothesis, calculation, conclusion)
- **Physics-Chem**: Formula first, then numbers; check units at each step; SI conversions; significant figures
- **SVT**: Analyze documents (diagrams, graphs, tables); observation → interpretation → conclusion; exact scientific vocab; cite document evidence
- **Never** invent curriculum content; flag out-of-scope exercises

## Publication Checklist (from `publication-snapnasser` skill)

- Apple Developer account (user creates)
- Bundle ID, version, build number
- Icon: orange on cream, legible small
- Screenshots: home, text verification, solution, history (French text)
- Description: revision aid for 3ème année, may make mistakes
- TestFlight → few students + teacher → iterate
- Privacy policy (web, French): what's sent, no photo storage, no tracking, no accounts
- Camera/galley usage explanations in French
- Pre-submit: all tests pass on real iPhone, no API key anywhere, production Worker deployed with 10/day limit, warning visible, README/todo.md current

## Available Skills

Use `Skill({ skill: "name", args: "..." })` to invoke:

| Skill | Purpose |
|-------|---------|
| `milestone` | Execute next milestone from `todo.md` |
| `swiftui-snapnasser` | iOS app conventions (UI, data, services) |
| `worker-snapnasser` | Cloudflare Worker conventions |
| `programme-tunisien` | Tunisian curriculum rules for solutions |
| `tests-snapnasser` | Testing methodology |
| `publication-snapnasser` | TestFlight/App Store preparation |

## Key Reminders

- **Milestone 0** (Preparation) is first: Xcode project, Git, theme, folder structure
- Current status: **empty repository** — no Xcode project or Worker yet
- Small commits, simple code, no unnecessary libraries
- All user-visible text in French
- Ask questions when decisions aren't in the spec
- User is not a developer — explain simply
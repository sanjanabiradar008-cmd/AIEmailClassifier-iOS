# AIEmailClassifier-iOS

A native iOS and iPadOS monitoring client that integrates with automated backend sorting systems like n8n or Make.com. 

This mobile client visualizes real-time status updates from an AI-driven email classification pipeline, helping businesses filter priority leads from junk communications instantly.

## 🤖 AI Automation Architecture
- **Inbound Webhook Sync:** Designed to display live webhook payloads routed from backend logic platforms.
- **Dynamic State Filtering:** Uses customized SwiftUI structures (`@State`) to instantly process multi-branch array values based on AI sentiment models.
- **Asynchronous UI Updates:** Features active layout loaders (`ProgressView`) to track pending background script operations seamlessly.

## 🛠️ Technical Stack
- **Language:** Swift 5.x
- **Framework:** SwiftUI
- **Environment:** Swift Playgrounds / Xcode
- **Backend Flow:** Integrated via n8n Logic Triggers

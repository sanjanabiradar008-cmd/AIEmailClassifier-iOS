import SwiftUI

// 1. Data model for incoming emails
struct IncomingEmail: Identifiable, Hashable {
    let id = UUID()
    let sender: String
    let subject: String
    let snippet: String
    var aiClassification: String = "Analyzing..."
    var statusColor: Color = .gray
}

struct ContentView: View {
    // 2. Mock dataset showing your n8n processing pipeline
    @State private var emails = [
        IncomingEmail(sender: "john@company.com", subject: "Looking for enterprise pricing", snippet: "Hi Sanjana, we love your iOS automation portfolio and want to hire you to build an app for our team of 50 people next month."),
        IncomingEmail(sender: "spambot3000@web.com", subject: "Cheap insurance quotes now!", snippet: "Click this link immediately to save thousands on your next health insurance payment plan today.")
    ]
    
    @State private var isProcessing = false
    
    var body: some View {
        NavigationStack {
            VStack {
                // Section A: Control Banner
                HStack {
                    VStack(alignment: .leading) {
                        Text("Connected to n8n Webhook")
                            .font(.caption)
                            .bold()
                            .foregroundColor(.green)
                        Text("Live Inbox Agent")
                            .font(.headline)
                    }
                    Spacer()
                    
                    Button(action: {
                        runN8NEmailAutomation()
                    }) {
                        Text(isProcessing ? "Sorting..." : "Run AI Sorter")
                            .bold()
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(isProcessing ? Color.gray : Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .disabled(isProcessing)
                }
                .padding()
                .background(Color(.systemGray6))
                
                // Section B: Live List Display
                List(emails) { email in
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text(email.sender)
                                .font(.subheadline)
                                .bold()
                            Spacer()
                            Text(email.aiClassification)
                                .font(.caption)
                                .bold()
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(email.statusColor.opacity(0.15))
                                .foregroundColor(email.statusColor)
                                .cornerRadius(4)
                        }
                        
                        Text(email.subject)
                            .font(.footnote)
                            .foregroundColor(.secondary)
                        
                        Text(email.snippet)
                            .font(.caption)
                            .foregroundColor(.primary)
                            .lineLimit(2)
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("AI Inbox Classifier")
        }
    }
    
    // 3. Simulates routing data through the automated loop
    func runN8NEmailAutomation() {
        isProcessing = true
        
        // Simulates network latency from n8n conditional nodes
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            emails[0].aiClassification = "🔥 HOT LEAD"
            emails[0].statusColor = .green
            
            emails[1].aiClassification = "🗑️ SPAM BLOCKED"
            emails[1].statusColor = .red
            
            isProcessing = false
        }
    }
}

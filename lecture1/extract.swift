import Foundation
import PDFKit

let args = CommandLine.arguments
guard args.count > 1 else { exit(1) }
let url = URL(fileURLWithPath: args[1])
guard let doc = PDFDocument(url: url) else { print("cannot open"); exit(2) }
print("PAGES: \(doc.pageCount)")
for i in 0..<doc.pageCount {
    guard let page = doc.page(at: i) else { continue }
    print("\n===== PAGE \(i+1) =====")
    print(page.string ?? "<no text>")
}

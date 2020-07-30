//
//  ContentView.swift
//  SnipBoard
//
//  Created by Jason Merino on 6/26/20.
//  Copyright © 2020 Jason Merino. All rights reserved.
//

import SwiftUI
import CoreData

struct SnippetItem: Identifiable {
    var id = UUID()
    var createdAt = Date()
    var text: String
}

struct ContentView: View {
    @State private var newSnippetItem = ""
    @State private var showingAlert = false
    @State private var snippetItems = [SnippetItem]()
    
    private func getDate(date: Date) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = "MMM dd, YYYY"
        return dateformat.string(from: date)
    }
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Add a new snippet")) {
                    HStack {
                        TextField("New snippet", text: $newSnippetItem)
                        Button(action: {
                            
                            if (self.newSnippetItem == "") {
                                self.showingAlert = true
                                return
                            }
                            
                            self.snippetItems.append(SnippetItem(text: self.newSnippetItem))
                            
                            self.newSnippetItem = ""
                        }) {
                            Image(systemName: "plus.circle.fill").foregroundColor(.orange)
                                .imageScale(.large)
                        }.alert(isPresented: $showingAlert) {
                            Alert(title: Text("Nice try..."), message: Text("Enter a snippet before trying to save."), dismissButton: .default(Text("Got it!")))
                        }
                    }
                }.font(.headline)
                Section(header: Text("Snippets")) {
                    ForEach(self.snippetItems) {snippetItem in
                        VStack(alignment: .leading) {
                            Text(snippetItem.text).font(.headline)
                            Text(self.getDate(date: snippetItem.createdAt)).font(.caption)
                        }
                    }.onDelete { indexSet in
                        print("delete")
                    }
                }
            }
            .navigationBarTitle(Text("SnipBoard"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

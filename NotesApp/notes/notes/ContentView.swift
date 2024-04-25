//
//  ContentView.swift
//  notes
//
//  Created by StudentAM on 3/28/24.
//
struct Note: Hashable{
    var title: String
    var info:String
}
import SwiftUI

struct ContentView: View {
    @State private var notes: [Note] = []
    
    var body: some View {
        NavigationView {
            VStack {
                //create a list for the notes
                List {
                    //list all the notes
                    ForEach(notes, id: \.self) { note in
                        NavigationLink(
                            //takes it to notesview
                            destination: NotesView(title: note.title, info: note.info),
                            label: {
                                VStack(alignment: .leading) {
                                    Text(note.title)
                                        .font(.headline)
                                    Text(note.info)
                                        .font(.body)
                                }
                            })
                    }
                }
                //navigates it to the add note page
                NavigationLink {
                    //when the note is added, it shows up
                    AddNote(notes: $notes)
                } label: {
                    Text("Add Note")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .padding()
                        .background(.blue)
                        .cornerRadius(7)
                }

            }
            //title
            .navigationTitle("Notes")
            .padding()
        }
    }
}


#Preview {
    ContentView()
    //makes ir=t so you can't scroll
        .scrollDisabled(true)
}

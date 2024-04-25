//
//  AddNote.swift
//  notes
//
//  Created by StudentAM on 4/9/24.
//

import SwiftUI

struct AddNote: View {
    @State var title: String = ""
    @State var info: String = ""
    @Binding var notes: [Note]
//    @Environment(\.presentationMode) var presentationMode
    //allows me to go to another page when button is clicked
    @Environment(\.dismiss) var dismiss
    var isFormFilled: Bool {
        !title.isEmpty && !info.isEmpty
    }
    var body: some View {
        NavigationView{
            VStack{
                //create a text field to store the title
                TextField("title", text: $title)
                    .padding()
                    .font(.title)
                    .frame(width: 375)
                    .background(Color(red:211/255, green: 211/255, blue:211/255))
                    .cornerRadius(5)
                    .padding(5)
                
                VStack {
                    //allows me to add the information to the bio
                    TextEditor( text: $info)
                        .frame(width: 340)
                        .frame(maxHeight: .infinity)
                        .padding()
                        .background(Color(.white))
                    //                        //allows multiple lines in the textfield
                    //                        .lineLimit(nil)
                        .multilineTextAlignment(.leading)
                        .border(Color(red:211/255, green: 211/255, blue:211/255), width: 15)
                        .cornerRadius(5)
                    //if the button is filled out, the notes saves to the front
                    Button(action: {
                        if isFormFilled {
                            //shows the note format as titleand info
                            notes.append(Note(title: title, info: info))
//                            presentationMode.wrappedValue.dismiss()
                        }
                        //allows the button to go back to content view when clicked
                        dismiss()
                        }) {
                        Text("Add Note")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 150, height: 50)
                            .background(Color.blue)
                            .cornerRadius(10)
                                .padding()
                                }
                                //makes the button not work when there's no information filled
                                .disabled(!isFormFilled)
                                

                }
            }
            //creates a tit;e
            .navigationTitle("New Note")
        }
    }
}

#Preview {
    AddNote(notes: .constant([]))
}

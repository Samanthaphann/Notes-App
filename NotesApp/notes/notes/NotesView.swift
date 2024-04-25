//
//  NotesView.swift
//  notes
//
//  Created by StudentAM on 4/9/24.
//

import SwiftUI

struct NotesView: View {
    var title = ""
    var info = ""
    var body: some View {
        NavigationView{
            VStack {
                //shows the info text
                Text("\(info)")
                    .padding()
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color(red:225/255, green: 225/255, blue:225/255))
                    }
        }
        //shows the title 
        .navigationTitle("\(title)")
    }
}

#Preview {
    NotesView()
}

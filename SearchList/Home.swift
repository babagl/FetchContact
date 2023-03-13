//
//  Home.swift
//  SearchList
//
//  Created by Abdoulaye Aliou SALL on 13/03/2023.
//

import SwiftUI

struct Home: View {
    @State var searchQuery = ""
    @ObservedObject var viewModel = ContactsViewModel()
    var body: some View {
        
        VStack{
            VStack{
                HStack{
                    Button(action: {}, label: {
                        Image(systemName: "star")
                            .font(.title2)
                            .foregroundColor(.primary)
                    })
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        Image(systemName: "plus")
                            .font(.title2)
                            .foregroundColor(.primary)
                    })
                    
                }
                .padding()
                HStack{
                    (
                        Text("My ")
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        
                        +
                        Text("Contacts")
                            .foregroundColor(.gray)
                    )
                    .font(.largeTitle)
                    Spacer()
                }
                .padding()
                
                //search bar
                HStack(spacing: 15){
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 23, weight: .bold))
                        .foregroundColor(.gray)
                    
                    TextField("Search", text: $searchQuery)
                    
                }
                .padding(.vertical, 10)
                .padding(.horizontal)
                .background(.primary.opacity(0.05))
                .cornerRadius(8)
                .padding(.horizontal)
                
                //Divider Line
                HStack{
                    Text("Recents")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                    Rectangle()
                        .fill(.primary.opacity(0.6))
                        .frame(height:0.5)
                }
                .padding()
            }
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack(spacing: 12 ){
                    ForEach(viewModel.contacts){contact in
                        HStack {
                            Text(contact.familyName)
                                .font(.title)
                                .foregroundColor(.primary)
                            Text(contact.phoneNumber)
                                .font(.title3)
                                .foregroundColor(.gray)
                        }
                        
                    }
                }
            })
        }
        .onAppear{(viewModel.fetchContacts())}
    }
        
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

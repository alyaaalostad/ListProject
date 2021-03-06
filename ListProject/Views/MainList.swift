//
//  MainList.swift
//  ListProject
//
//
/* problems we've faced:
 
 *the image we want it to be a uiimage and not a string in our struct // hasan
 
 */
//
//

import SwiftUI

struct MainList: View {
    
    @EnvironmentObject var env: Env

    @State var isEditTravel = false // this var to make the array edit not append new one
    @State var isEdit = false
    @State var isEditShopping = false
    @State var isEditCeleb = false
    var backgroungColor = "Background"
    @State var isWorkWillAdd = false
    @State var isWorkWillEditT = false
    @State var isWorkWillEditC = false
    @State var isWorkWillEditS = false
    @State var isWorkWillEdit = false   //DONT FORGET TO TOGGLE IT SO WHEN YOU COME BACK AFTER THE FIRST TIME ITS NOT ALWAYS TRUE
    @State var nameList = ""
    var body: some View {
        NavigationView{
            ZStack {
                Color(backgroungColor)
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    HStack{
//                        NavigationLink(destination: CreateNewList(isEdit: $isEdit).environmentObject(self.env), isActive: $isWorkWillAdd){
//                            Text("")
//                        }
//                        NavigationLink(destination: TravelListDetails(isEdit: $isEditTravel).environmentObject(self.env), isActive: $isWorkWillEditT){
//                            Text("")
//                        }
//                        NavigationLink(destination: celebrationDetailsList(isEdit: $isEditCeleb).environmentObject(self.env), isActive: $isWorkWillEditC){
//                            Text("")
//                        }
//                        NavigationLink(destination: ShoppingListDetail(isEdit: $isEditShopping).environmentObject(self.env), isActive: $isWorkWillEditS){
//                            Text("")
//                        }
                        Text("")
                    }
                    VStack{
//                        if self.env.alltravelLists.count != 0{
//                        self.env.alltravelLists[0].picture
//                            .resizable()
//                            .frame(width: 80, height: 80)
//                        }
                                

                        List{
                           
                            VStack{
                        Text(self.env.currentTravelList.lista.type.name())
                            .foregroundColor(Color.black)
                            .bold()
                            .font(.system(size:24))
                                
                                ScrollView(.horizontal){
                                    HStack{
                                    
                    ForEach(self.env.alltravelLists, id: \.self){ i in
                        VStack{
                        Image(uiImage: i.picture!)
                            .resizable()
                            .frame(width: 100, height: 100)
                            Text(i.lista.givenName)
                                .foregroundColor(Color.black)
                                .bold()
                                .font(.system(size:24))
                            
                        }.onTapGesture {
                        self.isWorkWillEditT = true
                        self.env.currentTravelList = i
                        self.isEditTravel = true
                        print(self.env.alltravelLists)
                               print(i.lista.givenName)
                        print("HEREEEEEEE")
                          
                        }.padding(.all, 20)
                    }.sheet(isPresented: $isEditTravel) {
                        TravelListDetails(isEdit: self.$isEditTravel).environmentObject(self.env)
                    }
                    }
                                     }
                      }
                    VStack{
                        Text(self.env.currentCelebrationList.lista.type.name())
                            .foregroundColor(Color.black)
                            .bold()
                            .font(.system(size:24))
                        ScrollView(.horizontal){
                         HStack{
                        ForEach(self.env.allCelebrationLists, id: \.self){ i in
                            VStack{
                            Image(uiImage: i.picture!)
                                .resizable()
                                .frame(width: 100, height: 100)
                                Text(i.lista.givenName)
                                    .foregroundColor(Color.black)
                                    .bold()
                                    .font(.system(size:24))
                                
                            }.onTapGesture {
                            self.isWorkWillEditT = true
                            self.env.currentCelebrationList = i
                            self.isEditTravel = true
                            print(self.env.allCelebrationLists)
                                   print(i.lista.givenName)
                            print("HEREEEEEEE")
                              
                            }.padding(.all, 20)
                        }.sheet(isPresented: $isEditCeleb) {
                            celebrationDetailsList(isEdit: self.$isEditCeleb).environmentObject(self.env)
                        }
                             }
                            }
                    }
                    VStack{
                        Text(self.env.currentShoppingList.lista.type.name())
                            .foregroundColor(Color.black)
                            .bold()
                            .font(.system(size:24))
                        ScrollView(.horizontal){
                             HStack{
                        ForEach(self.env.allShoppingLists, id: \.self){ i in
                               VStack{
                                Image(uiImage: i.picture!)
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    Text(i.lista.givenName)
                                        .foregroundColor(Color.black)
                                        .bold()
                                        .font(.system(size:24))
                                    
                                }.onTapGesture {
                                self.isWorkWillEditT = true
                                self.env.currentShoppingList = i
                                self.isEditTravel = true
                                print(self.env.alltravelLists)
                                       print(i.lista.givenName)
                                print("HEREEEEEEE")
                                  
                                }.padding(.all, 20)
                        }.sheet(isPresented: $isEditShopping) {
                            ShoppingListDetail(isEdit: self.$isEditShopping).environmentObject(self.env)
                           }
                             }
                        }
                    }
                     }
                     }
                   
                }
                .navigationBarTitle(Text("To Do List"))
                .navigationBarItems(trailing:
                    NavigationLink(destination: CreateNewList(isEdit: $isEdit).environmentObject(self.env)){
                        Image(systemName: "plus.circle").imageScale(.large)
                        .foregroundColor(Color("red"))
                        .font(.system(size: 25)) }
                    // the above navigation is instead of the below , and i remove navigation from the beginning of the page
//                    Button(action: {
//                        self.isWorkWillAdd = true
//
//                    }) {
//                        Image(systemName: "plus.circle").imageScale(.large)
//                            .foregroundColor(Color("red"))
//                            .font(.system(size: 25))
//                    }
                )
            }.colorMultiply(Color(backgroungColor))
            .navigationBarBackButtonHidden(true)
        }
    }
}



struct MainList_Previews: PreviewProvider {
    static var previews: some View {
        MainList().environmentObject(Env())
    }
}

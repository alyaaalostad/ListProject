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
   // @State var OverallList : [OverallList] = TotalList
   @State var isEditTravel = false // this var to make the array edit not append new one
    @State var isEdit = false
     @State var isEditShopping = false
     @State var isEditCeleb = false
    var backgroungColor = "Background"
    @State var isWorkWillAdd = false
    @State var isWorkWillEdit = false   //DONT FORGET TO TOGGLE IT SO WHEN YOU COME BACK AFTER THE FIRST TIME ITS NOT ALWAYS TRUE
    @State var nameList = ""
    var body: some View {
        NavigationView{
            ZStack {
                Color(backgroungColor)
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    HStack{
                        NavigationLink(destination: CreateNewList(isEdit: $isEdit).environmentObject(self.env), isActive: $isWorkWillAdd){
                            Text("")
                        }
                        NavigationLink(destination: TravelListDetails(isEdit: $isEditTravel).environmentObject(self.env), isActive: $isWorkWillEdit){
                           Text("")
                        }
                        NavigationLink(destination: celebrationDetailsList(isEdit: $isEditCeleb).environmentObject(self.env), isActive: $isWorkWillEdit){
                                               Text("")
                                            }
                                                NavigationLink(destination: ShoppingListDetail(isEdit: $isEditShopping).environmentObject(self.env), isActive: $isWorkWillEdit){
                                                                       Text("")
                                                                    }
                        
                    }
           
                              VStack{
                                  
                                Text(self.env.alltravelLists[0].lista.type.name())
                                      .foregroundColor(Color.black)
                                      .bold()
                                      .font(.system(size:24))
                                           }
                
                    
                    
                    ForEach(self.env.alltravelLists, id: \.self){ i in
                                                       VStack{
                                                  Text(i.lista.givenName)
                                                  .foregroundColor(Color.black)
                                                  .bold()
                                                  .font(.system(size:24))
                                                       }.padding(.vertical,2)
                                                   
                                      .onTapGesture {
                                                                                        self.isWorkWillEdit = true
                                                                                     self.env.currentTravelList = i
                                        self.isEditTravel = true
                                                                                            //print(self.env.alltravelLists)
               
                                                                                }
                            
                    }
                    VStack{
                                                  
                                                Text(self.env.allCelebrationLists[0].lista.type.name())
                                                      .foregroundColor(Color.black)
                                                      .bold()
                                                      .font(.system(size:24))
                        
                        
                           
                             ForEach(self.env.allCelebrationLists, id: \.self){ i in
                                                                VStack{
                                                           Text(i.lista.givenName)
                                                           .foregroundColor(Color.black)
                                                           .bold()
                                                           .font(.system(size:24))
                                                                }.padding(.vertical,2)
                                                            
                                               .onTapGesture {
                                                                                                 self.isWorkWillEdit = true
                                                                                              self.env.currentCelebrationList = i
                                                 self.isEditCeleb = true
                                                                                                     //print(self.env.alltravelLists)
                        
                                                                                         }
                        
                        
                                                                   }
                            }
                    VStack{
                                              
                                            Text(self.env.allShoppingLists[0].lista.type.name())
                                                  .foregroundColor(Color.black)
                                                  .bold()
                                                  .font(.system(size:24))
                    
                    
                       
                         ForEach(self.env.allShoppingLists, id: \.self){ i in
                                                            VStack{
                                                       Text(i.lista.givenName)
                                                       .foregroundColor(Color.black)
                                                       .bold()
                                                       .font(.system(size:24))
                                                            }.padding(.vertical,2)
                                                        
                                           .onTapGesture {
                                                                                             self.isWorkWillEdit = true
                                                                                          self.env.currentShoppingList = i
                                             self.isEditShopping = true
                                                                                                 //print(self.env.alltravelLists)
                    
                            }
                    }
                                            }
                    
                    
//                                                               }
                    

                    }

                    .navigationBarTitle(Text("To Do List"))
                    .navigationBarItems(trailing:
                        Button(action: {
                            self.isWorkWillAdd = true
                           
                        }) {
                            Image(systemName: "plus.circle").imageScale(.large)
                                .foregroundColor(Color("red"))
                                .font(.system(size: 25))
                        }
                    )
                }.colorMultiply(Color(backgroungColor))
     
            }
        }
    }



struct MainList_Previews: PreviewProvider {
    static var previews: some View {
        MainList().environmentObject(Env())
    }
}

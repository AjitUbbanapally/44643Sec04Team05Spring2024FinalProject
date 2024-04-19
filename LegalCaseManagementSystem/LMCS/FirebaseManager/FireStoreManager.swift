
import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseStorage
import Firebase
import FirebaseFirestoreSwift

struct Photo {
    var image: UIImage
    var downloadURL: URL?
}

class FireStoreManager {
   
   public static let shared = FireStoreManager()
   var hospital = [String]()

   var db: Firestore!
   var dbRef : CollectionReference!
   
   init() {
       let settings = FirestoreSettings()
       Firestore.firestore().settings = settings
       db = Firestore.firestore()
       dbRef = db.collection("Users")
   }
   
    func signUp(user: UserRegistrationModel,completion: @escaping (Bool)->() ) {
        
        getQueryFromFirestore(field: "email", compareValue: user.email ?? "") { querySnapshot in
            
           print(querySnapshot.count)
           
           if(querySnapshot.count > 0) {
               showAlerOnTop(message: "This Email is Already Registerd!!")
           }else {
               
               // Signup
               
               let data = ["name":user.name ?? "","dob":user.dob ?? "","email":user.email ?? "","password":user.password ?? "","phone":user.phone ?? "","userType":user.userType ?? "","barId":user.barId ?? "","billingAddress": user.billingAddress ?? ""] as [String : Any]
               
               self.addDataToFireStore(data: data) { _ in
                   
                   showOkAlertAnyWhereWithCallBack(message: "Registration Successful!!") {
                        
                       DispatchQueue.main.async {
                           completion(true)
                       }
                      
                   }
                   
               }
              
           }
       }
   }
   
   
   func login(email:String,password:String,completion: @escaping (Bool)->()) {
       
       let  query = db.collection("Users").whereField("email", isEqualTo: email)
       
       query.getDocuments { (querySnapshot, err) in
        
           print(querySnapshot?.count)

           if(querySnapshot?.count == 0) {
               showAlerOnTop(message: "Email id not found!!")
           }else {

               for document in querySnapshot!.documents {
                   print("doclogin = \(document.documentID)")
                   UserDefaults.standard.setValue("\(document.documentID)", forKey: "documentId")

                   if let pwd = document.data()["password"] as? String{

                       if(pwd == password) {

                           let name = document.data()["name"] as? String ?? ""
                           let email = document.data()["email"] as? String ?? ""
                           let phone = document.data()["phone"] as? String ?? ""

                           UserDefaultsManager.shared.saveData(name: name, email: email, phone: phone)
                           completion(true)

                       }else {
                           showAlerOnTop(message: "Password doesn't match")
                       }


                   }else {
                       showAlerOnTop(message: "Something went wrong!!")
                   }
               }
           }
       }
  }
       
   func getPassword(email:String,password:String,completion: @escaping (String)->()) {
       let  query = db.collection("Users").whereField("email", isEqualTo: email)
       
       query.getDocuments { (querySnapshot, err) in
        
           if(querySnapshot?.count == 0) {
               showAlerOnTop(message: "Email id not found!!")
           }else {

               for document in querySnapshot!.documents {
                   print("doclogin = \(document.documentID)")
                   UserDefaults.standard.setValue("\(document.documentID)", forKey: "documentId")
                   if let pwd = document.data()["password"] as? String{
                           completion(pwd)
                   }else {
                       showAlerOnTop(message: "Something went wrong!!")
                   }
               }
           }
       }
  }
   
   func getQueryFromFirestore(field:String,compareValue:String,completionHandler:@escaping (QuerySnapshot) -> Void){
       
       dbRef.whereField(field, isEqualTo: compareValue).getDocuments { querySnapshot, err in
           
           if let err = err {
               
               showAlerOnTop(message: "Error getting documents: \(err)")
                           return
           }else {
               
               if let querySnapshot = querySnapshot {
                   return completionHandler(querySnapshot)
               }else {
                   showAlerOnTop(message: "Something went wrong!!")
               }
              
           }
       }
       
   }
   
   func addDataToFireStore(data:[String:Any] ,completionHandler:@escaping (Any) -> Void){
       let dbr = db.collection("Users")
       dbr.addDocument(data: data) { err in
                  if let err = err {
                      showAlerOnTop(message: "Error adding document: \(err)")
                  } else {
                      completionHandler("success")
                  }
    }
       
       
   }
   
    func updatePassword(documentid:String, userData: [String:String] ,completion: @escaping (Bool)->()) {
        let  query = db.collection("Users").document(documentid)
        
        query.updateData(userData) { error in
            if let error = error {
                print("Error updating Firestore data: \(error.localizedDescription)")
                // Handle the error
            } else {
                print("Profile data updated successfully")
                completion(true)
                // Handle the success
            }
        }
    }
    
    func addCaseToFirestore(_ caseDetails: CaseDetails,completion: @escaping (Bool)->()) {
        let db = Firestore.firestore()
        let casesCollection = db.collection("CaseMatter")
        
        do {
            let caseData = try Firestore.Encoder().encode(caseDetails)
            
            casesCollection.addDocument(data: caseData) { error in
                if let error = error {
                    print("Error adding case: \(error)")
                    completion(false)
                } else {
                    completion(true)
                    print("Case added successfully!")
                }
            }
        } catch {
            completion(false)
            print("Error encoding case data: \(error)")
        }
    }
    
    func fetchCaseDetails(completion: @escaping ([CaseDetails]) -> Void) {
            let casesRef = db.collection("CaseMatter")

            casesRef.getDocuments { (snapshot, error) in
                if let error = error {
                    print("Error fetching documents: \(error)")
                    return
                }

                var caseDetailsArray = [CaseDetails]()

                guard let documents = snapshot?.documents else {
                    print("No documents found.")
                    completion([])
                    return
                }

                for document in documents {
                    let data = document.data()

                    let dateOfIncident = data["dateOfIncident"] as? String ?? ""
                    let caseType = data["caseType"] as? String ?? ""
                    let caseDescription = data["caseDescription"] as? String ?? ""
                    let statuteOfLimitationsDate = data["statuteOfLimitationsDate"] as? String ?? ""
                    let matterValue = data["matterValue"] as? String ?? ""
                    let attorneyFees = data["attorneyFees"] as? String ?? "0.0"
                    let courtName = data["courtName"] as? String ?? ""
                    let matterId = data["matterId"] as? String ?? ""
                    let caseTitle = data["caseTitle"] as? String ?? ""
                    let partyName = data["partyName"] as? String ?? ""
                    let partyId = data["partyId"] as? String ?? ""
                    let userId = UserDefaultsManager.shared.getDocumentId()

                    let caseDetail = CaseDetails(dateOfIncident: dateOfIncident,
                                                 caseType: caseType,
                                                 caseDescription: caseDescription,
                                                 statuteOfLimitationsDate: statuteOfLimitationsDate,
                                                 matterValue: matterValue,
                                                 attorneyFees: attorneyFees,
                                                 courtName: courtName,
                                                 matterId: matterId,
                                                 caseTitle: caseTitle,
                                                 partyName: partyName,
                                                 userId: userId, partyId: partyId)

                    caseDetailsArray.append(caseDetail)
                    completion(caseDetailsArray)
                }

                print(caseDetailsArray)
            }
        }

    func deleteCaseDetail(_ caseDetail: CaseDetails, completion: @escaping (Bool) -> Void) {
        let query = db.collection("CaseMatter").whereField("matterId", isEqualTo: caseDetail.matterId)
        
        query.getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error querying case detail from Firestore: \(error.localizedDescription)")
                completion(false)
            } else {
                guard let documents = querySnapshot?.documents, !documents.isEmpty else {
                    print("No documents found with the specified matterId.")
                    completion(false)
                    return
                }
                
                var deleteSuccess = true
                
                let dispatchGroup = DispatchGroup()
                
                for document in documents {
                    dispatchGroup.enter()
                    
                    document.reference.delete { error in
                        if let error = error {
                            print("Error deleting document from Firestore: \(error.localizedDescription)")
                            deleteSuccess = false
                        }
                        
                        dispatchGroup.leave()
                    }
                }
                
                // Wait for all deletions to complete
                dispatchGroup.notify(queue: .main) {
                    completion(deleteSuccess)
                }
            }
        }
    }

    
    func fetchPartyDetails(completion: @escaping ([PartyDetails]) -> Void) {
        let casesRef = db.collection("PartyList")

        casesRef.getDocuments { (snapshot, error) in
            if let error = error {
                print("Error fetching documents: \(error)")
                completion([])
                return
            }

            var partyDetailsArray = [PartyDetails]()

            guard let documents = snapshot?.documents else {
                print("No documents found.")
                completion([])
                return
            }

            for document in documents {
                let data = document.data()

                if var partyDetails = try? Firestore.Decoder().decode(PartyDetails.self, from: data) {
                    // Set the documentID property of the partyDetails object
                    partyDetails.documentID = document.documentID
                    partyDetailsArray.append(partyDetails)
                } else {
                    print("Error decoding party details for document ID: \(document.documentID)")
                }
            }

            completion(partyDetailsArray)
        }
    }


    
    func addProfileScoreToFirestore(_ partyDetails: PartyDetails,completion: @escaping (Bool, String?)->()) {
        let db = Firestore.firestore()
        let casesCollection = db.collection("PartyList")
        
        do {
                let caseData = try Firestore.Encoder().encode(partyDetails)
                
                casesCollection.addDocument(data: caseData) { error in
                    if let error = error {
                        print("Error adding case: \(error)")
                        completion(false, nil)
                    } else {
                        // Retrieve the newly added document and its document ID
                        casesCollection.whereField("partyName", isEqualTo: partyDetails.partyName).getDocuments { snapshot, error in
                            if let error = error {
                                print("Error retrieving document: \(error)")
                                completion(false, nil)
                            } else if let document = snapshot?.documents.first {
                                let documentID = document.documentID
                                completion(true, documentID)
                                print("Case added successfully with document ID: \(documentID)")
                            } else {
                                completion(false, nil)
                                print("Failed to retrieve document ID.")
                            }
                        }
                    }
                }
            } catch {
                completion(false, nil)
                print("Error encoding case data: \(error)")
            }
    }
    
    func updateProfile(documentid:String, user: UserRegistrationModel ,completion: @escaping (Bool)->()) {
        let  query = db.collection("Users").document(documentid)
        
        let userData = ["name":user.name ?? "","dob":user.dob ?? "","email":user.email ?? "","password":user.password ?? "","phone":user.phone ?? "","userType":user.userType ?? "","barId":user.barId ?? "", "billingAddress": user.billingAddress] as [String : Any]

        query.updateData(userData) { error in
            if let error = error {
                print("Error updating Firestore data: \(error.localizedDescription)")
            } else {
                print("Profile data updated successfully")
                completion(true)
            }
        }
    }
}

//
//  GuestEditor.swift
//  Mixer
//
//  Created by Josh Smith on 12/28/23.
//

import SwiftUI
import PhotosUI
import SwiftData

struct GuestEditor: View {
    
    @State private var name = ""
    @State private var addingPhoto = false
    
    @State private var photoItem: PhotosPickerItem?
    @State private var photo: Image?
    @State private var photoData: Data?
    
    @Query (sort: \Guest.name) private var guests: [Guest]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 15) {
                
                Button {
                    addingPhoto.toggle()
                } label: {
                    if let photo {
                        photo
                            .resizable()
                            .scaledToFill()
                            .frame(width: 175, height: 175, alignment: .center)
                            .clipShape(.circle)
                    } else {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 175, height: 175, alignment: .center)
                            .foregroundStyle(.white, .gray.gradient)
                    }
                }
                .photosPicker(isPresented: $addingPhoto, selection: $photoItem, matching: .images)
                .onChange(of: photoItem) {
                    Task {
                        if let image = try? await photoItem?.loadTransferable(type: Image.self) {
                            self.photo = image
                        }
                        if let photoData = try? await photoItem?.loadTransferable(type: Data.self) {
                            self.photoData = photoData
                        }
                    }
                }
                
                Button(photo == nil ? "Add Photo" : "Edit") {
                    addingPhoto.toggle()
                }
                .buttonBorderShape(.capsule)
                .buttonStyle(.bordered)
                .foregroundStyle(.primary)
                
                HStack {
                    Text("Name")
                    TextField("Josh Smith", text: $name)
                        .multilineTextAlignment(.trailing)
                        .submitLabel(.done)
                }
                .padding()
                .background(Color.background2)
                .clipShape(.rect(cornerRadius: 10))
                
                if duplicate {
                    Text("This guest already exists.")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
                
                Spacer()
                
            }
            .padding()
            .navigationTitle("New Guest")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done", action: save)
                        .disabled(unfinished)
                }
            }
        }
    }
    
    func save() {
        if let photoData {
            modelContext.insert(Guest(name, photo: photoData))
        } else {
            modelContext.insert(Guest(name))
        }
        dismiss()
    }
    
    var duplicate: Bool {
        return guests.contains(where: { guest in
            guest.name.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) == name.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        })
    }
    
    var unfinished: Bool {
        if name.isEmpty || duplicate {
            return true
        }
        return false
    }
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
}

#Preview {
    GuestEditor()
        .modelContainer(for: Guest.self)
}

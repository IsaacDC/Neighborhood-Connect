# Neighborhood Watch Application  
**Created by**:  
- Andy Delgado  
- Alessandro Escobar  
- Isaac Del Castillo  
- Randy Iguanzo  

---

## Overview  
The **Neighborhood Watch Application** aims to connect people within their neighborhood, allowing users to host and join local events, fostering a stronger sense of community.

---

## Directory Structure of **Neighborhood Connect**

### 1. **Views**  
This directory contains the SwiftUI views for the application. Each view represents a different screen or UI component of the app.

- **ContentView.swift**:  
  Displays a login page that allows users to log in. Includes email and password input fields.

- **ProfileView.swift**:  
  Provides a sign-up form for users to create an account. Account creation is initiated when the "Sign Up" button is clicked.

- **HomeView.swift**:  
  Allows users to navigate to create and join group functionalities, as well as view created or joined groups. Displays the user's neighborhoods and upcoming events.

- **createGcView.swift**:  
  Interface allowing users to create new neighborhood groups. Neighborhood groups require a name, an age range, and a zip code.

- **CreateGroupChats.swift**:  
  Shows input fields for finding neighborhood groups, including zip code and age range. Contains a "Find Neighborhood Group" button.

- **chatsCreatedView.swift**:  
  Displays the neighborhood groups created or joined by the user, with two sections separating these groups.

- **settingsView.swift**:  
  Lists the UserID and email of the currently logged-in user. Contains a sign-out button that navigates back to the login page.

- **GroupChatOptionView.swift**:  
  Displays options when accessing a neighborhood group, allowing access to chat and event functionalities.

- **chatView.swift**:  
  Displays the chat interface for a specific group chat, including the message list and a text input field.

- **CreateEventView.swift**:  
  Provides a form to create a new event, including input fields for event details and a date picker.

- **EventDetailsView.swift**:  
  Shows detailed information about a specific event, including a map view with the event's location.

- **SignUpForEventView.swift**:  
  Lists available events for the user to sign up for and handles event registration.

- **UserEventsView.swift**:  
  Displays events that the user has signed up for and allows them to unsubscribe from events.

- **EventDetailsView.swift**:  
  Shows all the details of the event, including a map displaying the event's location.

---

### 2. **Models**  
This directory contains data models used in the application, including those for handling data from Firebase.

- **Event.swift**:  
  Defines the `Event` structure, including properties for event details and methods for converting to and from Firebase data.

---

### 3. **SupportingFiles**  
This directory includes files necessary for project configuration and setup.

- **AppDelegate.swift**:  
  Manages app lifecycle events and configuration.

- **GoogleService-Info.plist**:  
  Contains Firebase configuration settings and initialization code.

---

### 4. **Resources**  
This directory contains resources used throughout the app, such as images and asset catalogs.

- **Designer (1).png**:  
  The logo image of the application.

---

### 5. **Package Dependencies**  
These packages are required for the application to function and can be installed via the Google Firebase SDK inside XCode. These dependencies are also described in the instructional video.

- **FirebaseAuth**  
- **FirebaseDatabase**  
- **FirebaseDatabaseSwift**  
- **FirebaseMessaging**  
- **FirebaseStorage**

---

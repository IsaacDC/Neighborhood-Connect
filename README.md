Created by:
Andy Delgado
Alessandro Escobar
Isaac Del Castillo
Randy Iguanzo

This app aims to connect people within their neighborhood and be able to host and join events that are being hosted locally.

Directory Structure of Neighborhood Connect

1. Views
This directory contains the SwiftUI views for the application. Each view represents a different screen or UI component of the app.

ContentView.swift: Displays a Log In page that allows users to log in into the app. Shows an Email and Password input field.

ProfileView.swift: Provides a sign up form for a user input user information to create an account. Creates a new account onece "Sign Up" button is clicked.

HomeView.swift: Allows users to navigate to create and join group funtionalities, as well as viewing created or joined groups. Displays user's neighborhoods and upcoming events.

createGcView.swift: 

ChatView.swift: Displays the chat interface for a specific group chat. Includes message list and text input.

CreateEventView.swift: Provides a form to create a new event, including input fields for event details and a date picker.

EventDetailsView.swift: Shows detailed information about a specific event, including a map view with the event's location.

SignUpForEventView.swift: Lists available events for the user to sign up for and handles event registration.

UserEventsView.swift: Displays events that the user is signed up for and allows them to unsubscribe from events.


2. Models
This directory contains data models used in the application, including those for handling data from Firebase.

Event.swift: Defines the Event structure, including properties for event details, and methods for converting to and from Firebase data.


3. SupportingFiles
This directory includes files necessary for project configuration and setup.

AppDelegate.swift: Manages app lifecycle events and configuration.

GoogleService-info: Contains Firebase configuration settings and initialization code.


4. Resources
This directory contains resources used throughout the app, such as images and asset catalogs.
Designer (1).png: The logo image of our application.

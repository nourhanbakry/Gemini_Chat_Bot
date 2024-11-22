
## 🌟 Gemini Chat Bot 
Welcome to **Gemini Chat Bot**, a simple yet powerful chatbot application that leverages Google Generative AI's Gemini model to provide intelligent and engaging responses. Whether you're asking questions, sending images with prompts, or simply experimenting with AI-powered conversations, Gemini Chat Bot ensures a smooth and intuitive experience.  

This project is designed using **Flutter** with a focus on clean architecture principles, applying separation of concerns, modularization, and scalable code practices. The goal is to maintain code clarity and adhere to clean coding standards, creating a maintainable and extendable application.  

Gemini Chat Bot is a single-feature application demonstrating clean code principles in a practical implementation.  

## 📃 Features  
- **Text-Based Conversations**: Type a message, and the chatbot will provide intelligent responses powered by Gemini AI.  
- **Image-Based Prompts**: Upload an image alongside a text prompt for context-specific AI responses.    
- **Dynamic UI Updates**: Messages from the user and bot are displayed in a seamless, conversational flow.  
- **Responsive Design**: Fully optimized for mobile devices, ensuring a smooth user experience on all screen sizes.  

## 🏗️ Project Structure (Clean Architecture)  

Gemini Chat Bot adopts a **modular clean architecture** for better code organization:  

### 1. Core  
   - Common widgets, helpers, and reusable components (e.g., toast messages, loading animations).  

### 2. Features  
   - The chatbot feature, containing its own layers:  
     - **Data Layer**:  
       Handles API integration with Gemini's model using the `google_generative_ai` package.  
     - **Logic Layer**:  
       - `Cubit` for managing the app's state (e.g., loading, success, failure).  
       - Ensures a clear flow of events between the data and UI layers.  
     - **Presentation Layer**:  
       - Contains UI components and screens, such as chat bubbles, input fields, and animated loading dots.  

## 📷 Screenshots  
<p align="center">
  <img src="https://github.com/user-attachments/assets/0cb7f58a-1594-4950-ab3f-c80c5d270c08" alt="Screenshot 1" width="150"/>
  <img src="https://github.com/user-attachments/assets/fa5fb416-34cb-4945-a301-715a60ac11ad" alt="Screenshot 3" width="150"/>
  <img src="https://github.com/user-attachments/assets/68de793e-a1e3-4b4c-9721-8260152deed0" alt="Screenshot 4" width="150"/>
  <img src="https://github.com/user-attachments/assets/cd0f7e34-4cf5-488f-84ae-0ae147e0f801" alt="Screenshot 5" width="150"/>
  <img src="https://github.com/user-attachments/assets/06a6092f-35f1-4dbe-8f2b-1257746999ec" alt="Screenshot 7" width="150"/>
</p>
  
## 🏭 Installation  

### **Navigate to the Project Directory**  
```bash  
cd GeminiChatBot  

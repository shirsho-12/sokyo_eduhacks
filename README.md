# sokyo

Connect with like-minded students in your class.

## Inspiration
Forming study groups is never easy. In a room full of strangers you need to go and connect with people. This becomes even harder for people who cannot attend classes regularly due to various reasons: maybe the student is a single mother who has to take care of her child, or maybe a student who has to work multiple jobs just to stay afloat. There are also a number of people who suffer from anxieties or phobias and do not want to be physically in a classroom with even hundreds of people. Whatever the reason may be, students shouldn't be disadvantaged in learning just because they cannot afford to come to class in person. Now, what if there was an app that helps make these study groups for you?
## What it does
Sokyo is a learning platform built upon the pillars of communication and socializing. A user first creates an account on the platform, selects the courses they are taking for the semester and sees other users also taking the course. The user then has the option to contact the person via the app or create groups based on shared courses/interests. The app's main appeal is the ability to find study buddies in the same course. 

Sokyo comes from the Proto-Indo-European word sokʷyo meaning companion.
![App Home Page](https://github.com/shirsho-12/sokyo_eduhacks/blob/master/assets/images/home_page.jpg "App Homepage")

*App Home Page*
## How I built it
I built the app using Flutter, Google Firebase Authentication, and Google Cloud Firestore and followed the BLoC framework for business logic delineation. I used Firebase Auth for email and Google logins.
![Firebase Auth](https://github.com/shirsho-12/sokyo_eduhacks/blob/master/assets/images/firebase.PNG "Firebase Authentication)

*Firebase Authentication*
## Challenges we ran into
Making the login backend complete was difficult. I implemented login, registration, forget password, chat, and Google Sign-In functionalities. While doing so, a lot of the business logic separation was difficult and time-consuming. In addition, creating a sleek UI was probably the hardest challenge for me. 
I attempted to create a working chat function using Cloud Firestore but it proved to be extremely difficult as Firebase does not provide a built-in Peer-to-Peer chat function. The current chat functionality is based on local SQL storage instead. I also attempted to try this with Cloud Functions but in the end, stayed with Cloud Firestore.
## Accomplishments that I am proud of
I am proud to have created a functional app with a complete authentication system and navigation. I learned how to use Cloud Firestore and also got the chance to try out GCP storage buckets for image storage.
## What I learned
I learned how to use Google Cloud Functions, GCP Storage buckets, Firebase Authentication, and an in-depth system to create a peer-to-peer chat system using Cloud Firestore.
## What's next for Sokyo
I want to improve the Study Buddy matching functionality by allowing users to state their own interests and skills in their profiles. I then want to use a keyword extraction algorithm like RAKE on the chats with Cloud Functions to dynamically assess their interests and use this information to create a dynamic matching system.

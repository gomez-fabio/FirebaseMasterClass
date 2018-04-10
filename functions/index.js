const functions = require('firebase-functions');
const admin = require('firebase-admin');

admin.initializeApp(functions.config().firebase);

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
exports.helloWorld = functions.https.onRequest((request, response) => {
 response.send("Hello Fistros Pecadores!");
});

exports.newMessage = functions.database.ref('/messages/{discussionId}/{messageId}').onWrite((event) =>{
    // var message = event.data.val();
    console.log(event);
})
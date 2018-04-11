const functions = require('firebase-functions');
const admin = require('firebase-admin');

admin.initializeApp(functions.config().firebase);

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
exports.helloWorld = functions.https.onRequest((request, response) => {
 response.send("Hello Fistros Pecadores!");
});

exports.newMessage = functions.database.ref('/messages/{discussionId}/{messageId}').onWrite((event, context) =>{
    const discussionId = context.params.discussionId;
    const messageId = context.params.messageId;

    const message = event.after.val();

    if (!message) {
        return;
    }

    console.log(message);
    
    return true;

});
import * as functions from "firebase-functions";
import * as express from "express";
import * as admin from "firebase-admin";

admin.initializeApp();
const db = admin.firestore();
const productsApp = express();

productsApp.post("/", async (request, response) => {
    try {
        const testData = request.body;
        await db.collection("testData").add(testData);
        response.status(201).send();
    } catch (error) {
        console.log(error);
        response.status(500).send(error);
    }
});

productsApp.get("/:id", async (request, response) => {
    try {
        const testData = request.body;
        await db.collection("testData").add(testData);
        response.status(201).send();
    } catch (error) {
        console.log(error);
        response.status(500).send(error);
    }
});


export const products = functions.https.onRequest(productsApp);

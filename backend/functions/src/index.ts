import * as functions from "firebase-functions";
import * as express from "express";
import * as admin from "firebase-admin";
import {validateFirebaseIdToken} from "./auth";
import * as fileUploadMiddleware from "busboy-firebase";
import {uploadImageFiles} from "./utils";

admin.initializeApp();
const db = admin.firestore();
const combatFoodApp = express();
combatFoodApp.use(validateFirebaseIdToken);


combatFoodApp.post("/user/signup", async (request:any, response) => {
    try {
        const userId = request.user.user_id;
        if ((await db.collection("users").doc(userId).get()).exists) {
            response.status(200).send("This user already exists.");
            return;
        }
        await db.collection("users").doc(userId).create({...request.body});
        response.status(201).send("Account was succesfully created.");
    } catch (error) {
        console.log(error);
        response.status(500).send(error);
    }
});

combatFoodApp.post("/restaurant/signup", async (request:any, response) => {
    try {
        const restaurantId = request.user.user_id;
        if ((await db.collection("restaurants").doc(restaurantId).get()).exists) {
            response.status(200).send("This restaurant already exists.");
            return;
        }
        await db.collection("restaurants").doc(restaurantId).create({...request.body});
        response.status(201).send("Account was succesfully created.");
    } catch (error) {
        console.log(error);
        response.status(500).send(error);
    }
});


combatFoodApp.get("/products", async (request:any, response) => {
    try {
        // const userId = request.user.user_id;
        response.status(200).send();
    } catch (error) {
        console.log(error);
        response.status(500).send(error);
    }
});

combatFoodApp.get("/products:product_id", async (request, response) => {
    try {
        // const productId = request.params.product_id;
        response.status(200).send();
    } catch (error) {
        console.log(error);
        response.status(500).send(error);
    }
});


combatFoodApp.get("/likes", async (request:any, response) => {
    try {
        // const userId = request.user.user_id;
        response.status(200).send();
    } catch (error) {
        console.log(error);
        response.status(500).send(error);
    }
});

combatFoodApp.post("/", async (request, response) => {
    try {
        const testData = request.body;
        await db.collection("testData").add(testData);
        response.status(201).send();
    } catch (error) {
        console.log(error);
        response.status(500).send(error);
    }
});

combatFoodApp.get("/", async (request:any, response) => {
    try {
        const user = request.user;
        response.status(201).send({email: user.email, id: user.id});
    } catch (error) {
        console.log(error);
        response.status(500).send(error);
    }
});

combatFoodApp.get("/testUser", async (request:any, response)=>{
    try {
        response.status(200).send();
    } catch (error) {
        console.log(error);
        response.status(500).send("Failed");
    }
});

combatFoodApp.post("/restaurant/products", fileUploadMiddleware, async (request:any, response:any)=>{
    try {
        const restaurantId = request.user.user_id;
        const snapshot = await db.collection("restaurants").doc(restaurantId).get();
        const restaurantName = snapshot.data()?.name;
        if (!restaurantName)response.status(500).send("Invalid restaurant");
        console.log("RestaurantName: ", restaurantName);

        const productInfo:PostedProduct = JSON.parse(request.body.productInfo);
        const productId = productInfo.name + Date.now().toString();
        await Promise.all(uploadImageFiles(admin, request.files, restaurantName, productId));

        response.status(200).send();
    } catch (error) {
        console.log(error);
        response.status(500).send("Failed");
    }
});


export const api = functions.https.onRequest(combatFoodApp);

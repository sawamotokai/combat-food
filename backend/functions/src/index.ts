import * as functions from "firebase-functions";
import * as express from "express";
import * as admin from "firebase-admin";
import {validateFirebaseIdToken} from "./auth";
import * as fileUploadMiddleware from "busboy-firebase";
import {uploadImageFiles, registerProducts} from "./utils";

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
    // TODO: return 10 images?
    try {
        // const userId = request.user.user_id;
        response.status(200).send();
    } catch (error) {
        console.log(error);
        response.status(500).send(error);
    }
});


combatFoodApp.get("/products:product_id", async (request, response) => {
    // reutrn detail of a product
    try {
        // const productId = request.params.product_id;
        response.status(200).send();
    } catch (error) {
        console.log(error);
        response.status(500).send(error);
    }
});


combatFoodApp.post("/likes", async (request:any, response) => {
    // using user_id, return liked items
    try {
        const userId = request.user.user_id;
        const likesDislikes:LikesDislikes = request.body;
        console.log(likesDislikes);
        const snapshot = await db.collection("users").doc(userId).get();
        const likes = new Set(snapshot.data()?.likes);
        const disLikes = new Set(snapshot.data()?.dislikes);
        likesDislikes.likes.forEach((item)=>likes.add(item));
        likesDislikes.disLikes.forEach((item)=>disLikes.add(item));

        await db.collection("users").doc(userId).update({
            "likes": [...likes],
            "dislikes": [...disLikes],
        });

        response.status(200).send();
    } catch (error) {
        console.log(error);
        response.status(500).send(error);
    }
});


combatFoodApp.get("/likes", async (request:any, response) => {
    // apend recived items to user's likes list
    // and check if it's expired, locked,... or not
    try {
        const userId = request.user.user_id;
        const allLikes = (await db.collection("users").doc(userId).get()).data()?.likes;
        const likes:string[]=[];

        await Promise.all(allLikes.map(async (productId:string)=>{
            const expTimeStamp = (await db.collection("products").doc(productId).get()).data()?.expiredAt;
            if (!expTimeStamp) return;
            const expire = Number(String(expTimeStamp.seconds) + String(expTimeStamp.nanoseconds/1000000));
            if (expire<=Date.now()) {
                console.log("ifif");
                likes.push(productId);
            }
        }));
        console.log(likes);
        response.status(200).send({"likes": likes});
    } catch (error) {
        console.log(error);
        response.status(500).send(error);
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
        productInfo.expiredAt = new Date(productInfo.expiredAt);
        productInfo.lockedUntil = new Date(productInfo.lockedUntil);

        const productId = productInfo.name + Date.now().toString();
        await Promise.all(uploadImageFiles(admin, request.files, restaurantName, productId));
        const resRegister = await registerProducts(db, productInfo, productId);

        response.status(200).send(resRegister);
    } catch (error) {
        console.log(error);
        response.status(500).send("Failed");
    }
});


export const api = functions.https.onRequest(combatFoodApp);

import * as functions from "firebase-functions";
import * as express from "express";
import * as admin from "firebase-admin";
import {validateFirebaseIdToken} from "./auth";
import * as fileUploadMiddleware from "busboy-firebase";
import {getValidLikes, uploadImageFiles} from "./utils";
import {ProductStatus, LikesDislikes, PostedProduct} from "./types";

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
        console.log("test");
        response.status(200).send();
    } catch (error) {
        console.log(error);
        response.status(500).send(error);
    }
});


combatFoodApp.get("/confirmation/:product_id", async (request:any, response) => {
    // lock the item for XX min
    try {
        const productId = request.params.product_id;
        const product = (await db.collection("products").doc(productId).get()).data();

        if (product?.status!=ProductStatus.AVAILABLE) {
            response.status(200).send();
            return;
        } else if (
            product?.lockedBy != request.user.user_id &&
            product.lockedUntil > admin.firestore.Timestamp.fromDate(new Date())) {
            response.status(200).send("This product is locked by someone.");
            return;
        } else {
            // get lock
            const nowDate = new Date();
            nowDate.setSeconds(nowDate.getSeconds()+120);
            const lockedUntil = admin.firestore.Timestamp.fromDate(nowDate);
            await db.collection("products").doc(productId).update({
                "lockedBy": request.user.user_id,
                "lockedUntil": lockedUntil,
                "status": ProductStatus.LOCKED,
            });
            response.status(200).send("This product is locked for 2minutes.");
        }
        response.status(200).send();
    } catch (error) {
        console.log(error);
        response.status(500).send(error);
    }
});

combatFoodApp.get("/checkout/:product_id", async (request:any, response) => {
    // lock the item for XX min
    try {
        const productId = request.params.product_id;
        const product = (await db.collection("products").doc(productId).get()).data();
        const restaurantId = product?.restaurantId;
        if (product?.lockedBy != request.user.user_id) {
            response.status(200).send("Illegal user");
            return;
        } else {
            await db.collection("products").doc(productId).update({
                "status": ProductStatus.PURCHASED,
                "purchasedBy": request.user.user_id,
            });
            await db.collection("restaurants").doc(restaurantId).update({
                "history": admin.firestore.FieldValue.arrayUnion({
                    "imageUrl": productId,
                    "custromer_fullname": request.user.user_id,
                    "ordered_at": String(new Date()),
                    "price": product?.price,
                }),
            });
            console.log("AAAAAAAAAAAAA");
            response.status(200).send("Purchased!!");
        }
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
        const allLikes:Set<string> = new Set(snapshot.data()?.likes);
        const disLikes:Set<string> = new Set(snapshot.data()?.dislikes);
        likesDislikes.likes.forEach((item)=>allLikes.add(item));
        likesDislikes.disLikes.forEach((item)=>disLikes.add(item));
        await db.collection("users").doc(userId).update({
            "likes": [...allLikes],
            "dislikes": [...disLikes],
        });
        const likes = await getValidLikes(admin, db, [...allLikes]);
        console.log(likes);
        response.status(200).send({"likes": likes});
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
        const likes = await getValidLikes(admin, db, allLikes);
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
        productInfo.status = ProductStatus.AVAILABLE;
        productInfo.restaurantId = restaurantId;
        const productId = productInfo.name + Date.now().toString();
        const results = await Promise.all([
            uploadImageFiles(admin, request.files, restaurantName, productId),
            db.collection("products").doc(productId).create({...productInfo}),
            db.collection("restaurants").doc(restaurantId).update({
                products: admin.firestore.FieldValue.arrayUnion(productId),
            }),
        ]);
        console.log(results);
        response.status(200).send(results);
    } catch (error) {
        console.log(error);
        response.status(500).send("Failed");
    }
});


combatFoodApp.get("/restaurant/products", async (request:any, response:any)=>{
    try {
        const restaurantId = request.user.user_id;
        const products = (await db.collection("restaurants").doc(restaurantId).get()).data()?.products;
        console.log(products);
        response.status(200).send({"products": products});
    } catch (error) {
        console.log(error);
        response.status(500).send("Failed");
    }
});


combatFoodApp.get("/restaurant/history", async (request:any, response:any)=>{
    try {
        //
        const restaurantId = request.user.user_id;
        const history = (await db.collection("restaurants").doc(restaurantId).get()).data()?.history;
        console.log([...history]);
        response.status(200).send({
            "orders": [...history],
        });
    } catch (error) {
        console.log(error);
        response.status(500).send("Failed");
    }
});


export const api = functions.https.onRequest(combatFoodApp);

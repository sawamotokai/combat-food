

export const uploadImageFiles = (admin:any, files:PostedFiles[], restaurantName:string, productId:string) =>{
    const promises:Promise<any>[] = [];
    files.forEach((file, ind)=>{
        const bucket = admin.storage().bucket();
        const buffer = file.buffer;
        // TODO: reduce the file size
        const res = bucket.file(`${restaurantName}/${productId}/${ind}.png`).save(buffer);
        promises.push(res);
    });
    return promises;
};


export const getValidLikes = async (admin:any, db:any, allLikes:Array<string>)=>{
    const likes:string[]=[];
    await Promise.all(allLikes.map(async (productId:string)=>{
        const expTimeStamp = (await db.collection("products").doc(productId).get()).data()?.expiredAt;
        if (!expTimeStamp) return;
        if (expTimeStamp>admin.firestore.Timestamp.fromDate(new Date())) likes.push(productId);
    }));
    return likes;
};

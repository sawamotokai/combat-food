

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

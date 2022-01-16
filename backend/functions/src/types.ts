export interface PostedFiles{
    fieldname: string,
    originalname: string,
    encoding: string,
    mimetype: string,
    buffer: Buffer,
    size: number
}

export enum ProductStatus{
    "AVAILABLE",
    "LOCKED",
    "PURCHASED",
    "EXPIRED",
    "DELETED"
}

export interface PostedProduct{
    name: string,
    restaurantId:string,
    price:number
    expiredAt: Date,
    lockedUntil: Date,
    lockedBy:string,
    status:ProductStatus
}


export interface LikesDislikes{
    likes:string[],
    disLikes:string[]
}

interface PostedFiles{
    fieldname: string,
    originalname: string,
    encoding: string,
    mimetype: string,
    buffer: Buffer,
    size: number
}

enum ProductStatus{
    "AVAILABLE",
    "LOCKED",
    "PURCHASED",
    "EXPIRED",
    "DELETED"
}

interface PostedProduct{
    name: string,
    expiredAt: Date,
    lockedUntil: Date,
    lockedBy:string,
    status:ProductStatus
}


interface LikesDislikes{
    likes:string[],
    disLikes:string[]
}

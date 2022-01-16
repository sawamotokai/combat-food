interface PostedFiles{
    fieldname: string,
    originalname: string,
    encoding: string,
    mimetype: string,
    buffer: Buffer,
    size: number
}

interface PostedProduct{
    name: string,
    expiredAt: Date,
    lockedUntil: Date,
    lockedBy:string
}


interface LikesDislikes{
    likes:string[],
    disLikes:string[]
}

const fs = require("fs");
const path = require("path");

const bucketName = process.env.S3_BUCKET_NAME;
const region = process.env.AWS_REGION || "us-east-1";
const accessKeyId = process.env.AWS_ACCESS_KEY_ID;
const secretAccessKey = process.env.AWS_SECRET_ACCESS_KEY;

let s3Client = null;

if (bucketName && accessKeyId && secretAccessKey) {
    try {
        const { S3Client } = require("@aws-sdk/client-s3");
        s3Client = new S3Client({
            region,
            credentials: {
                accessKeyId,
                secretAccessKey,
            },
        });
        console.log(`[Storage] AWS S3 storage provider initialized in region ${region} using bucket ${bucketName}`);
    } catch (e) {
        console.error("[Storage] Failed to initialize S3Client, falling back to local storage:", e);
    }
} else {
    console.log("[Storage] Local storage provider initialized (AWS credentials or S3 bucket not specified)");
}

/**
 * Uploads a file either to S3 (if configured) or to local public folder
 * @param {object} file - express-fileupload file object
 * @param {string} folder - subfolder name (usually tenantId)
 * @param {string} filename - target filename
 * @returns {Promise<string>} - The URL or local path to the file
 */
exports.uploadFile = async (file, folder, filename) => {
    if (s3Client) {
        const { Upload } = require("@aws-sdk/lib-storage");
        const fsStream = fs.createReadStream(file.tempFilePath);
        
        const upload = new Upload({
            client: s3Client,
            params: {
                Bucket: bucketName,
                Key: `public/${folder}/${filename}`,
                Body: fsStream,
                ContentType: file.mimetype,
                ACL: "public-read", // Ensure public access if reading directly from S3
            },
        });

        await upload.done();
        return `https://${bucketName}.s3.${region}.amazonaws.com/public/${folder}/${filename}`;
    } else {
        // Fallback to local storage
        const targetDir = path.join(__dirname, `../../public/${folder}/`);
        if (!fs.existsSync(targetDir)) {
            fs.mkdirSync(targetDir, { recursive: true });
        }
        const imagePath = path.join(targetDir, filename);
        await file.mv(imagePath);
        return `/public/${folder}/${filename}`;
    }
};

/**
 * Deletes a file either from S3 (if configured) or from local public folder
 * @param {string} filename - target filename (uniqueId or id)
 * @param {string} folder - subfolder name (usually tenantId)
 * @returns {Promise<void>}
 */
exports.deleteFile = async (filename, folder) => {
    if (s3Client) {
        const { DeleteObjectCommand } = require("@aws-sdk/client-s3");
        const deleteCommand = new DeleteObjectCommand({
            Bucket: bucketName,
            Key: `public/${folder}/${filename}`,
        });
        await s3Client.send(deleteCommand);
    } else {
        // Fallback to local storage
        const imagePath = path.join(__dirname, `../../public/${folder}/`, filename);
        if (fs.existsSync(imagePath)) {
            fs.unlinkSync(imagePath);
        }
    }
};

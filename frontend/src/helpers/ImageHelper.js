import { API_IMAGES_BASE_URL } from "../config/config";

export function getImageURL(path) {
    if (!path) return null;
    if (path.startsWith("http://") || path.startsWith("https://")) {
        return path;
    }
    return API_IMAGES_BASE_URL + path;
}
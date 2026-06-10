import { getUserDetailsInLocalStorage } from "./UserDetails";

export function isRestroUserAuthenticated() {
    const restroAuthenticated = document.cookie.includes("restroprosaas__authenticated=");
    if (restroAuthenticated) return true;

    // Fallback: if cross-origin cookies are blocked/unreadable by JavaScript,
    // verify authentication using user details in localStorage.
    const user = getUserDetailsInLocalStorage();
    return !!user;
}
import Cookies from "js-cookie";

const useAuth = () => {
    const cookie = Cookies.get("api_token")
    console.log(cookie)

    return cookie !== undefined
}
export default useAuth;
import Cookies from "universal-cookie"

const $cookies = new Cookies()
const $cookiesOpt = {
  path: "/",
  maxAge: 60 * 60 * 24 * 7, // 1week
}

export { $cookies, $cookiesOpt }

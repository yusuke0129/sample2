import Cookies from "universal-cookie"
const cookieparser = require("cookieparser")
export const state = () => ({
  auth: false,
  name: "",
  text: "",
})

export const getters = {
  name(state) {
    return state.name
  },
}

export const mutations = {
  setName(state, { name }) {
    state.name = name
  },
  setAuth(state, { auth }) {
    state.auth = auth
  },
  setMessage: (state, { text }) => {
    state.text = text // stateの状態を変更する
  },
}

export const actions = {
  nuxtServerInit({ commit }, { req }) {
    let auth = null
    if (req.headers.cookie) {
      auth = cookieparser.parse(req.headers.cookie)
      try {
        commit("setAuth", auth)
      } catch (e) {}
    }
  },
}

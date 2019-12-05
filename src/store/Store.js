import Vue from 'vue'
import Vuex from 'vuex'
Vue.use(Vuex)

const state = {
    showEdit: false,
    connected: false,
    showSearchNotice: false,
    userConnect: [],
}

const mutations = {
    CHANGE_EDIT: state => {
        state.showEdit = !state.showEdit
    },
    CONNECT: (state, user) => {
        state.userConnect = [];
        state.connected = true;
        state.userConnect.push(user)
    },
    DISCONNECT: (state, user) => {
        state.connected = false
        let i = state.userConnect.indexOf(user)
        state.userConnect.splice(i, 1)
        localStorage.removeItem("user")
    },
    CHANGE_SHOW_NOTICE: state => {
        state.showSearchNotice = !state.showSearchNotice
    }
}
const getters = {
    doneShowEdit: state => {
        return state.showEdit
    },
    doneUserSession: state => {
        return state.userSession
    },
    doneConnect: state => {
        return state.connected
    },
    doneUserConnected: state => {
        return state.userConnect[0]
    }
}
//let store pour pouvoir y avoir accès sur la console...
let store = new Vuex.Store({
    state: state,
    mutations: mutations,
    getters: getters,
    actions: {},
    strict: true
})
global.store = store
export default store
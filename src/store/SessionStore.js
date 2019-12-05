class SessionStore {
  constructor() {
    this.state = {
      id_user: 0,
      user_lastName: "",
      user_firstName: "",
      sid: 0,
      connect: false,
    }
  }
  connect() {
    this.state.connect = true
  }
  disconnect() {
    this.state.connect = false
  }
}
export default new SessionStore()

class ClockStore {

  constructor() {
    this.state = {
      datetime: ""
    }
  }

  increment() {
    this.state.count++
  }

  decrement() {
    this.state.count--
  }
}
export default new NotificationsStore()

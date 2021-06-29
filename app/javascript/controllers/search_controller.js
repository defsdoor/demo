import { Controller } from "stimulus" 

export default class extends Controller {
  static values = { refreshInterval: Number }
  static targets = ["entries", "input"]

  connect() {
    this.scrollController = this.application.getControllerForElementAndIdentifier(this.element, 'infinite-scroll');
    if (this.hasRefreshIntervalValue) {
      this.startObserving();
    }
  }

  disconnect() {
    this.stopObserving()
  }

  startObserving() {
    var previousValue=""
    this.observeTimer = setInterval(() => {
      var currentValue = this.inputTarget.value
      if (currentValue != previousValue) {
        this.scrollController.load(true);

      }
    }, this.refreshIntervalValue)
  }

  stopObserving() {
    if (this.observeTimer) {
      clearInterval(this.observeTimer)
    }
  }

}

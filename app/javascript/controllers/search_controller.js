import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["entries"]

  search(event) {
      let controller = this.application.getControllerForElementAndIdentifier(this.element, 'infinite-scroll');
      controller.load(true);
  }
}

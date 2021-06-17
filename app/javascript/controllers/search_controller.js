import { Controller } from "stimulus"

export default class extends Controller {

  search(event) {
    let thingy = event.target.dataset.searchFor;
    if (thingy) {
      let el = document.getElementById(thingy);
      if (el) {
        let controller = this.application.getControllerForElementAndIdentifier(el, 'infinite-scroll');
        controller.loadNew();
      }
    }

  }


}

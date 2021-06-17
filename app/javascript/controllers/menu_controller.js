import { Controller } from "stimulus"

export default class extends Controller {

  visit(event) {
    const element = $(event.target);
    if (element.data("url")) 
      Turbo.visit(element.data("url"));
  }
}

import { Controller } from "stimulus"

const defaultTheme = "hg-theme-default";
let keyboard;

export default class extends Controller {
  static targets = ["input"];

  connect() {
    keyboard = new Keyboard({
      onChange: input => this.onChange(input)
    });
  }

  hide(event) {
    let keyb = document.getElementById('simple-keyboard');
    if (! keyb.classList.contains('show-keyboard')) return;
    event.preventDefault()

    if (this.element === event.target || this.element.contains(event.target) || keyb.contains(event.target)) return;
    this.hideKeyboard();
  }

  reset() {
    keyboard.clearInput();
    this.inputTarget.value = "";
    this.sendChange()
  }

  show(event) {
    this.typeInTo=event.target
    keyboard.setInput(this.typeInTo.value);
    keyboard.setOptions({
      theme: `${defaultTheme} show-keyboard`
    });
  }

  hideKeyboard() {
    keyboard.setOptions({
      theme: defaultTheme
    });
  }

  onChange(input) {
    this.typeInTo.value = input;
    this.sendChange()
  }

  sendChange() {
    var e = document.createEvent('HTMLEvents');
    e.initEvent('change', false, true);
    this.inputTarget.dispatchEvent(e);
  }

}


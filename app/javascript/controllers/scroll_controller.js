import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="scroll"
export default class extends Controller {
  /* on start */
  connect() {
    console.log("Connected");
    const messages = document.getElementById("messages");
    messages.addEventListener("DOMNodeInserted", this.resetScroll);
    this.resetScroll(messages);
  }
  /* on stop */
  disconnect() {
    console.log("Disconnected");
  }
  /* Custom function*/
  resetScroll(){
    messages.scrollTop = messages.scrollHeight - messages.clientHeight;
  }
}

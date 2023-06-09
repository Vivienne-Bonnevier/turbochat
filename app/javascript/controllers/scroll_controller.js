import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="scroll"
export default class extends Controller {
  initialize() {
    this.resetScrollWithoutThreshold(messages);
  }
  /** On start */
  connect() {
    console.log("Connected scroll");
    const messages = document.getElementById("messages");
    messages.addEventListener("DOMNodeInserted", this.resetScroll);
  }
  /** On stop */
  disconnect() {
    console.log("Disconnected");
  }
  /** Custom function */
  resetScroll() {
    const bottomOfScroll = messages.scrollHeight - messages.clientHeight;
    const upperScrollThreshold = bottomOfScroll - 500;
    // Scroll down if we're not within the threshold
    if (messages.scrollTop > upperScrollThreshold) {
      messages.scrollTop = messages.scrollHeight - messages.clientHeight;
    }
  }
  resetScrollWithoutThreshold(messages) {
    messages.scrollTop = messages.scrollHeight - messages.clientHeight;
  }
}

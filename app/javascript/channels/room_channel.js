import consumer from "channels/consumer"

const appRoom = consumer.subscriptions.create("RoomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    let parser = new DOMParser();
    let doc = parser.parseFromString(data['message'], 'text/html');
    document.getElementById("timeline").prepend(doc.body.firstElementChild);
  },

  speak: function(message, room_id) {
    return this.perform('speak', {message: message, room_id: room_id});
  }
});

let button = document.getElementById("send")
button.addEventListener('click', function () {
  let message = document.getElementById("message");
  let room_id = document.getElementById("room_id");
  appRoom.speak(message.value, room_id.value);
  message.value = "";
});

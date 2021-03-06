import consumer from "./consumer";

const messagesContainer = document.getElementById('messages');
const id = messagesContainer.dataset.chatroomId;

consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
  received(data) {
    messagesContainer.insertAdjacentHTML('beforeend', data);
  },
});

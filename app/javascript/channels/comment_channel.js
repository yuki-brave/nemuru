import consumer from "./consumer"

if(location.pathname.match(/\/tweets\/\d/)){

  consumer.subscriptions.create({
    channel: "CommentChannel",
    tweet_id: location.pathname.match(/\d+/)[0] 
  }, {

    connected() {
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      const html = `
        <p>
          <strong><a href="/users/${data.comment.user_id}"> ${data.user.nickname}</a>：</strong>
          ${data.comment.text}
        </p>`
      const comments = document.getElementById("comments");
      comments.insertAdjacentHTML('afterbegin', html);
      const commentForm = document.getElementById("comment_form");
      commentForm.reset();
    }
  });
};
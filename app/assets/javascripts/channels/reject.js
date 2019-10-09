App.reject = App.cable.subscriptions.create("RejectChannel", {
  received: function(data) {
    let post = $(`#${data['post_id']}`);
    post.removeClass('border-b');
    post.addClass('border-4 border-red-400');
  },
  rejection: function(post_id, user_id) {
    return this.perform('rejection', {
      post_id: post_id,
      receiver_id: receiver_id
    });
  }
});



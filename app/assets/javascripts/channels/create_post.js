App.create_post = App.cable.subscriptions.create("CreatePostChannel", {
  received: function(data) {
    let post = $(`#post_${data['post_id']}`);
    post.removeClass('border-b');
    post.addClass('border-4 border-red-400');
  },
  creation: function(data) {
    return this.perform('creation', data);
  }
});

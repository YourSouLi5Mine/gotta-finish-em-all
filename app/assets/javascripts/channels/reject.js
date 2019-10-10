App.reject = App.cable.subscriptions.create("RejectChannel", {
  received: function(data) {
    let post = $(`#post_${data['post_id']}`);
    post.removeClass('border-b');
    post.addClass('border-4 border-red-400');
  },
  rejection: function(data) {
    return this.perform('rejection', data);
  }
});

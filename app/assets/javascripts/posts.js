$(document).ready(function () {
  $('.reject').click(function(e) {
    const self = this;

    swal({
      title: 'Reject post by:',
      showCancelButton: true,
      confirmButtonText: 'Content',
      cancelButtonText: 'Media'
    })
      .then(() => {
        App.reject.rejection({
          'post_id': self.attributes['post_id'].value,
          'receiver_id': self.attributes['content_creator_id'].value
        });
      })
      .catch(() => {
        App.reject.rejection({
          'post_id': self.attributes['post_id'].value,
          'receiver_id': self.attributes['designer_id'].value
        });
      });

    return false;
  });
});

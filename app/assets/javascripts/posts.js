$(document).ready(function () {
  $('.reject').click(function(e) {
    const self = this;

    swal({
      title: 'Rechazar publicación por',
      showCancelButton: true,
      confirmButtonText: 'Contenido',
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

  $('#create-post').click(function(e) {
    const self = this;

    App.reject.rejection({
      'post_id': self.attributes['post_id'].value,
      'receiver_id': self.attributes['content_creator_id'].value
    });

    return false;
  });
});

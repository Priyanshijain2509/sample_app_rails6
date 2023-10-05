$(document).ready(function () {
  $('.createCommentForm').on('submit', function (e) {
    e.preventDefault(); 
    const micropostId = $(this).data('micropost-id');
    const formData = $(this).serialize();
    const commentElementById = $(`#comment_${id}`);

    $.ajax({
      type: 'POST',
      url: `/microposts/${micropostId}/comments`,
      data: formData,
      success: function (response) {
        
        console.log(response)
      }
    });
  });
});


$(document).ready(function () {
  $('.deleteComment').on('click', function (e) {
    e.preventDefault();
    const micropostId = $(this).data('micropost-id');
    const commentId = $(this).data('comment-id');
    const id = $(this).attr('data-comment-id');
    const commentElementById = $(`#comment_${id}`);

    $.ajax({
      type: 'DELETE',
      url: `/microposts/${micropostId}/comments/${commentId}`,
      success: function (response) {
        commentElementById.remove();
      }
    });
  });
});

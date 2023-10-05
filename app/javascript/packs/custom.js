// $(document).ready(function () {
//   $('.delete-comment').on('click', function (e) {
//     e.preventDefault();
//     const micropostId = $(this).data('micropost-id');
//     const commentId = $(this).data('comment-id');
    
//     $.ajax({
//       type: 'DELETE',
//       url: `/microposts/${micropostId}/comments/${commentId}`, // Adjust the route as needed
//       success: function (response) {
//         $(`.deleteComment[data-comment-id="${commentId}"]`).remove();
//       }
//     });
//   });
// });


$(document).ready(function () {
  $('.deleteComment').on('click', function (e) {
    e.preventDefault();
    const micropostId = $(this).data('micropost-id');
    const commentId = $(this).data('comment-id');
    // Store a reference to the comment element for removal
    const commentElement = $(`.deleteComment[data-comment-id="${commentId}"]`);
    // Send an AJAX request to delete the comment using micropostId and commentId
    $.ajax({
      type: 'DELETE',
      url: `/microposts/${micropostId}/comments/${commentId}`,
      success: function (response) {
        // Handle success, remove the deleted comment from the DOM
        commentElement.remove();
      }
    });
  });
});




// $(document).ready(function () {
//   $('.deleteComment').on('click', function (e) {
//     e.preventDefault();
//     const micropostId = $(this).data('micropost-id');
//     const commentId = $(this).data('comment-id');
    
//     // Store a reference to the comment element for removal
//     const commentElement = $(`.deleteComment[data-comment-id="${commentId}"]`);
//     const nearestParagraph = $(this).closest('.DestroyComment').find('p');
//     // Send an AJAX request to delete the comment using micropostId and commentId
//     $.ajax({
//       type: 'DELETE',
//       url: `/microposts/${micropostId}/comments/${commentId}`,
//       success: function (response) {
//         // Handle success, remove the nearest parent element of the clicked "Delete" button
//         commentElement.closest('.DestroyComment').remove(); // Assuming the comment is wrapped in an element with class "comment"
//         nearestParagraph.remove();
//       }
//     });
//   });
// });

// $(document).ready(function () {
//   $('.deleteComment').on('click', function (e) {
//     e.preventDefault();
//     const micropostId = $(this).data('micropost-id');
//     const commentId = $(this).data('comment-id');
    
//     // Store a reference to the nearest <p> element for removal
//     const nearestParagraph = $(this).closest('.DestroyComment').find('p');

//     // Send an AJAX request to delete the comment using micropostId and commentId
//     $.ajax({
//       type: 'DELETE',
//       url: `/microposts/${micropostId}/comments/${commentId}`,
//       success: function (response) {
//         // Handle success, remove the nearest paragraph element
//         nearestParagraph.remove();
//       }
//     });
//   });
// });


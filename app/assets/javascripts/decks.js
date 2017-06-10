$(function() {
  function moveToNextCard(currentCardNum) {
    newCard = $('.card')[currentCardNum + 1];
    $(newCard).removeClass('hidden');
  };

  $('.controls').on('click', function() {
    card = $(this).parents('.card');
    cardNum = JSON.parse($(card).attr('id').split('_')[1]);

    $(card).addClass('hidden');
    moveToNextCard(cardNum);
  });

  $('.flip').on('click', function() {
    card = $(this).parents('.card');

    back = $(card).find('.back');
    $(back).removeClass('hidden');
  })
})

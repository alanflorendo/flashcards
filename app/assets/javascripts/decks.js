$(function() {
  var numCards = $('.card').length;
  var statsUpdater = new StatsUpdater;

  function moveToNextCard(nextCardNum) {
    newCard = $('.card')[nextCardNum];
    if (nextCardNum === numCards) {
      openSubmitPanel();
    } else {
      $(newCard).removeClass('hidden');
    }
  };

  function openSubmitPanel() {
    $('.submit-panel').removeClass('hidden');
  }

  $('.controls .right').on('click', function() {
    card = $(this).parents('.card');
    processCard(card, true);
  });

  $('.controls .wrong').on('click', function() {
    card = $(this).parents('.card');
    processCard(card, false);
  });

  function processCard(card, wasRight) {
    cardNum = JSON.parse($(card).attr('id').split('_')[1]);
    statsUpdater.update(cardNum, wasRight);

    $(card).addClass('hidden');
    moveToNextCard(cardNum + 1);
  };

  $('.flip').on('click', function() {
    card = $(this).parents('.card');

    back = $(card).find('.back');
    $(back).removeClass('hidden');
  })
})

function StatsUpdater () {
  this.stats = {};

  this.update = function(cardNum, wasRight) {
    this.stats[cardNum] = wasRight;
  }
}

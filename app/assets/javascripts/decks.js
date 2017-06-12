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

  $('.submit-panel .submit').on('click', function() {
    postStats();
  });

  function postStats() {
    $.ajax({
      type: 'PATCH',
      url: '/cards_batch_update',
      data: { cards: {
        flips: statsUpdater.stats,
        reviews: statsUpdater.reviews
        }
      }
    })
    .done(function() {
      window.location.href = data.redirect;
    })
    .fail(function() { alert('fail') })
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
    cardIdFullText = $(card).find('.card-id').html();
    cardId = JSON.parse($.trim(cardIdFullText));

    markReview = $(card).find('#review').is(':checked');
    statsUpdater.update(cardId, wasRight, markReview);

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
  this.reviews = {};

  this.update = function(cardId, wasRight, review) {
    this.stats[cardId] = wasRight;
    this.reviews[cardId] = review;
  };
}

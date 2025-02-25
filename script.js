$(document).ready(function() {
    const colors = ['red', 'blue', 'green', 'yellow', 'purple', 'orange', 'cyan', 'magenta', 'lime', 'pink'];
    let cardColors = [...colors, ...colors, ...colors, ...colors]; // יצירת מערך עם כפולות צבעים
    cardColors = shuffle(cardColors);

    let firstCard = null;
    let secondCard = null;
    let lockBoard = false;
    let matchedPairs = 0;

    // שיבוץ קלפים לתוך לוח המשחק
    cardColors.forEach(color => {
        $('.game-board').append(`<div class="card" data-color="${color}"><img src="https://via.placeholder.com/100/${color.replace('#', '')}" alt="Card"></div>`);
    });

    // הקשבה לאירועים של קליק על קלף
    $('.card').click(function() {
        if (lockBoard || $(this).hasClass('flipped') || $(this).is(firstCard)) return;

        $(this).addClass('flipped');
        $(this).find('img').show();

        if (!firstCard) {
            firstCard = $(this);
        } else {
            secondCard = $(this);
            checkForMatch();
        }
    });

    function checkForMatch() {
        if (firstCard.data('color') === secondCard.data('color')) {
            matchedPairs++;
            if (matchedPairs === cardColors.length / 2) {
                setTimeout(() => {
                    $('#success-message').show();
                }, 500);
            }
            resetBoard();
        } else {
            lockBoard = true;
            setTimeout(() => {
                firstCard.removeClass('flipped').find('img').hide();
                secondCard.removeClass('flipped').find('img').hide();
                resetBoard();
            }, 1000);
        }
    }

    function resetBoard() {
        [firstCard, secondCard] = [null, null];
        lockBoard = false;
    }

    function shuffle(array) {
        for (let i = array.length - 1; i > 0; i--) {
            const j = Math.floor(Math.random() * (i + 1));
            [array[i], array[j]] = [array[j], array[i]];
        }
        return array;
    }
});
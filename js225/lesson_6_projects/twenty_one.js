'use strict';

const rlsync = require('readline-sync');
const shuffle = require('shuffle-array');

class Game {
  constructor() {
    this.deck;
    this.dealer = new Dealer();
    this.human = new Human();
  }

  start() {
    this.#displayIntro();
    this.#playGame();
    this.#exitGame();
  }

  #displayIntro() {
    rlsync.question("Welcome to twenty-one. Press enter to start.");
  }

  #playGame() {
    while (true) {
      this.#resetGame();
      this.#humanTurn();
      if (!this.human.busted()) this.#dealerTurn();
      this.#displayWinner();
      if (this.#playAgain() === 'n') break;
    }
  }

  #dealInitialCards() {
    this.deck.dealCard(this.dealer);
    this.deck.dealCard(this.dealer);
    this.deck.dealCard(this.human);
    this.deck.dealCard(this.human);
    this.dealer.hideFIrstCard();
  }

  #humanTurn() {
    while (true) {
      this.#displayHands();
      const choice = this.human.hitOrStay();
      if (choice === 'hit') {
        this.deck.dealCard(this.human);
        this.#displayHands();
        if (this.human.busted()) {
          rlsync.question(`Your total is ${this.human.handTotal}, you busted!\n\nPress enter to continue.`);
          this.dealer.revealFirstCard();
          return;
        }
      } else if (choice === 'stay') {
        return;
      };
    }
  }

  #dealerTurn() {
    this.dealer.revealFirstCard();
    this.#displayHands();
    while (this.dealer.handTotal < 17) {
      rlsync.question('The dealer must hit when under 17.\n\nPress enter to continue.');
      this.deck.dealCard(this.dealer);
      this.#displayHands();
    }

    this.#endDealerTurn();
  }

  #endDealerTurn() {
    if (this.dealer.busted()) {
      rlsync.question('TThe dealer busted!\n\nPress enter to continue.');
    } else {
     rlsync.question('The dealer must stay at or above 17. \n\nPress enter for the results.');
    }
  }

  #displayHands() {
    console.clear();
    this.#displayHand(this.dealer);
    this.#displayScore(this.dealer);
    this.#displayHand(this.human);
    this.#displayScore(this.human);
  }

  #displayHand(player) {
    const rows = {1: '', 2: '', 3: '', 4: '', 5: '', 6: '', 7: ''};

    player.hand.forEach(card => {
      if (!card.hidden) {
        rows[1] += `+-------+ `;
        if (card.number === '10') {
          rows[2] += `|${card.number}     | `;
        } else {
          rows[2] += `|${card.number}      | `;
        }
        rows[3] += `|       | `;
        rows[4] += `|   ${card.suit}   | `;
        rows[5] += `|       | `;
        if (card.number === '10') {
          rows[6] += `|     ${card.number}| `;
        } else {;
          rows[6] += `|      ${card.number}| `;
        }
        rows[7] += `+-------+ `;
      }
    });

    for (let row in rows) {
      console.log(rows[row]);
    }
  }

  #displayScore(player) {
    if (player instanceof Dealer) {
      if (player.hand[0].hidden) {
        console.log(`The dealer's total is ${player.hand[1].value} but their second card is unknown.`);
      } else {
        console.log(`The dealer's total is ${player.handTotal}`);
      }
    } else {
      console.log(`Your total is ${player.handTotal}`);
    }
    console.log();
  }

  #displayWinner() {
    this.#displayHands();

    if (this.human.busted()) {
      console.log('You busted, the dealer wins!\n');
    } else if (this.dealer.busted()) {
      console.log('The dealer busted, you win!\n');
    } else {
      this.#determineWinner();
    }

    rlsync.question('Press enter to continue');
  }

  #determineWinner() {
    const humanTotal = this.human.handTotal;
    const dealerTotal = this.dealer.handTotal;

    if (humanTotal > dealerTotal) {
      console.log('You win!\n');
    } else if (humanTotal < dealerTotal) {
      console.log('You lose! :(\n');
    } else {
      console.log("It's a tie!\n");
    }
  }

  #playAgain() {

    let choice;
    while (!['y', 'n'].includes(choice)) {
      console.clear();
      choice = rlsync.question('Do you want to play again? (y/n): ');
    }

    return choice;
  }

  #resetGame() {
    this.deck = new Deck();
    this.human.resetHand();
    this.dealer.resetHand();
    this.#dealInitialCards();

  }

  #exitGame() {
    console.log('Thanks for playing, goodbye!');
  }
}

class Deck {
  constructor() {
    this.cards = this.#createDeck();
    shuffle(this.cards);
  }

  #createDeck() {
    const cards = [];

    Card.NUMBERS.forEach(num => {
      Card.SUITS.forEach(suit => {
        cards.push(new Card(num, suit));
      });
    });

    return cards;
  }

  dealCard(player) {
    const card = this.cards.pop();
    player.hand.push(card);
    player.handTotal += card.value;
    this.#checkAces(player);
  }

  #checkAces(player) {
    if (player.handTotal > 21) {
      let aces = player.hand.filter(card => card.number === 'A' && card.value === 11);
      while (player.handTotal > 21 && aces.length > 0) {
        player.handTotal -= 10;
        aces[0].value = 1;
        aces.shift();
      }
    }
  }
}

class Card {
  static NUMBERS = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'K', 'Q', 'A'];
  static SUITS = ["\u2660", "\u2663", "\u2665", "\u2666"];

  #number
  #suit
  #value
  #hidden

  constructor(number, suit, hidden = false) {
    this.#number = number;
    this.#suit = suit;
    this.#value = this.#cardValue(number);
    this.#hidden = hidden;
  }

  get number() {
    return this.#number;
  }

  get suit() {
    return this.#suit;
  }

  get value() {
    return this.#value;
  }

  get hidden() {
    return this.#hidden;
  }

  set value(num) {
    this.#value = num;
  }

  set hidden(option) {
    this.#hidden = option;
  }

  #cardValue(number) {
    let num = Number(number);

    if (num) {
      return num;
    } else if (number === 'A') {
      return 11;
    } else {
      return 10;
    }
  }

  hide() {
    this.hidden = true;
  }

  reveal() {
    this.hidden = false;
  }
}

class Player {
  #hand;
  #handTotal;

  get hand() {
    return this.#hand;
  }

  get handTotal() {
    return this.#handTotal;
  }

  set hand(newHand) {
    this.#hand = newHand;
  }

  set handTotal(newTotal) {
    this.#handTotal = newTotal;
  }

  busted() {
    return this.handTotal > 21;
  }

  resetHand() {
    this.hand = [];
    this.handTotal = 0;
  }
}

class Dealer extends Player {
  hideFIrstCard() {
    this.hand[0].hide();
  }

  revealFirstCard() {
    this.hand[0].reveal();
  }
}

class Human extends Player {
  hitOrStay() {
    return rlsync.question("Will you hit or stay?: ");
  }
}

new Game().start();

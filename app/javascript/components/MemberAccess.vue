<template>
  <div>
    <div class="header header--left">
      <div class="header__title">Ingresa el código</div>
      <button class="header__back" v-on:click="back()"></button>
    </div>
    <div class="passcode">
      <input type="password" v-model="inputCode[0]" class="passcode__digit" readonly>
      <input type="password" v-model="inputCode[1]" class="passcode__digit" readonly>
      <input type="password" v-model="inputCode[2]" class="passcode__digit" readonly>
      <input type="password" v-model="inputCode[3]" class="passcode__digit" readonly>
      <input type="password" v-model="inputCode[4]" class="passcode__digit" readonly>
    </div>
    <div class="keyboard">
      <div class="keyboard__column">
        <div @click="pushCharacter(1)" class="keyboard__item">1</div>
        <div @click="pushCharacter(4)" class="keyboard__item">4</div>
        <div @click="pushCharacter(7)" class="keyboard__item">7</div>
        <div @click="popCharacter()" class="keyboard__item">x</div>
      </div>
      <div class="keyboard__column">
        <div @click="pushCharacter(2)" class="keyboard__item">2</div>
        <div @click="pushCharacter(5)" class="keyboard__item">5</div>
        <div @click="pushCharacter(8)" class="keyboard__item">8</div>
        <div @click="pushCharacter(0)" class="keyboard__item">0</div>
      </div>
      <div class="keyboard__column">
        <div @click="pushCharacter(3)" class="keyboard__item">3</div>
        <div @click="pushCharacter(6)" class="keyboard__item">6</div>
        <div @click="pushCharacter(9)" class="keyboard__item">9</div>
        <div @click="confirm()" class="keyboard__item keyboard__item--confirm">OK</div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      code: "12345",
      inputCode: [],
    };
  },
  mounted() {
    document.getElementsByClassName("progress-bar")[0].style.width = '100%';
  },
  methods: {
    back() {
      this.$router.push({ path: '/' })
      document.getElementsByClassName("progress-bar")[0].style.width = "25%";
    },
    pushCharacter(character) {
      if (this.inputCode.length < 5) this.inputCode.push(character);
    },
    popCharacter() {
      this.inputCode.pop();
    },
    confirm() {
      if (this.inputCode.join("") === this.code) {
        //call api
        this.$router.push({ path: '/' });
      }
    },
  },
};
</script>
<style lang="scss">
@import '../styles/colors';

.passcode {
  letter-spacing: 20px;
  font-size: 40px;
  text-align: left;
  display: flex;
  justify-content: center;
  padding: 0;
  border: 0;
  margin: 0 auto;

  &__digit {
    border: 0;
    border-bottom: solid 5px;
    margin: 10px;
    width: 40px;
    font-size: 40px;
    text-align: center;
  }
}

.keyboard {
  display: flex;
  bottom: 0;
  width: 100%;
  position: absolute;

  &__column {
    display: flex;
    flex-direction: column;
    flex: 1;
  }

  &__item {
    border: solid .5px #eee;
    flex: 1;
    line-height: 75px;
    font-size: 34px;
    transition: background-color 200ms linear;
    user-select: none;

    &:active {
      background-color: $searchBarColor;
    }

    &--confirm {
      background-color: $progressBarColor;
      border-color: $progressBarColor;
      color: $contrastColor;
    }
  }
}
</style>

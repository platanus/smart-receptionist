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
        <div v-tap.prevent="{ methods:pushCharacter, character:1 }" class="keyboard__item">1</div>
        <div v-tap.prevent="{ methods:pushCharacter, character:4 }" class="keyboard__item">4</div>
        <div v-tap.prevent="{ methods:pushCharacter, character:7 }" class="keyboard__item">7</div>
        <div v-tap.prevent="{ methods:popCharacter }" class="keyboard__item">x</div>
      </div>
      <div class="keyboard__column">
        <div v-tap.prevent="{ methods:pushCharacter, character:2 }" class="keyboard__item">2</div>
        <div v-tap.prevent="{ methods:pushCharacter, character:5 }" class="keyboard__item">5</div>
        <div v-tap.prevent="{ methods:pushCharacter, character:8 }" class="keyboard__item">8</div>
        <div v-tap.prevent="{ methods:pushCharacter, character:0 }" class="keyboard__item">0</div>
      </div>
      <div class="keyboard__column">
        <div v-tap.prevent="{ methods:pushCharacter, character:3 }" class="keyboard__item">3</div>
        <div v-tap.prevent="{ methods:pushCharacter, character:6 }" class="keyboard__item">6</div>
        <div v-tap.prevent="{ methods:pushCharacter, character:9 }" class="keyboard__item">9</div>
        <div
          v-tap.prevent="{ methods:confirm }"
          :class="{ 'keyboard__item--error': wrongPasscode }"
          class="keyboard__item keyboard__item--confirm">
          OK
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import ApiService from '../services/api';
const client = new ApiService;

export default {
  data() {
    return {
      code: "12345",
      inputCode: [],
      wrongPasscode: false,
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
    pushCharacter(params) {
      if (this.inputCode.length < 5) this.inputCode.push(params.character);
    },
    popCharacter() {
      this.inputCode.pop();
      this.wrongPasscode = false;
    },
    confirm() {
      if (this.inputCode.join("") === this.code) {
        client.openFrontDoor()
        this.$router.push({ path: '/' });
      } else {
        this.wrongPasscode = true;
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
    transition: background-color 100ms linear;
    user-select: none;

    &:focus,
    &:active {
      background-color: $searchBarColor;
    }

    &--confirm {
      background-color: $progressBarColor;
      border-color: $progressBarColor;
      color: $contrastColor;
    }

    &--error {
      background-color: $passcodeErrorColor;
      border-color: $passcodeErrorColor;
    }
  }
}
</style>

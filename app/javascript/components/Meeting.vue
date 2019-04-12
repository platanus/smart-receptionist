<template>
  <div>
    <div class="header">
      <div class="header__title">{{title}}</div>
      <div class="header__subtitle">{{subtitle}}</div>
    </div>
    <div class="companies" v-show="!askGuestName">
      <button class="header__back" v-on:click="back()"></button>
      <div class="companies__company" v-on:click="showGuest('Buda')">
        <img class="companies__company__logo" :src="require('images/buda-logo.png')">
      </div>
      <div class="companies__company" v-on:click="showGuest('Fintual')">
        <img class="companies__company__logo" :src="require('images/fintual-logo.png')">
      </div>
      <div class="companies__company" v-on:click="showGuest('Platanus')">
        <img class="companies__company__logo" :src="require('images/platanus-logo.png')">
      </div>
    </div>
    <div class="guest" v-show="askGuestName">
      <button class="header__back" v-on:click="hideGuest()"></button>
      <input ref="input" v-model="guestName" class="guest__name" type="text" autofocus>
      <button class="guest__confirm">Notificar!</button>
    </div>
  </div>
</template>

<script>
export default {
  name: 'meeting',
  data() {
    return {
      title: 'Con quién es la reunión?',
      subtitle: '',
      company: '',
      guestName: '',
      askGuestName: false,
    };
  },
  methods: {
    showGuest(company) {
      this.company = company;
      this.askGuestName = true;
      this.title = '¿Cuál es tu nombre?';
      this.subtitle = `avisaré a ${company} que llegaste`;
      this.$refs.input.focus();
    },
    hideGuest() {
      this.company = '';
      this.askGuestName = false;
      this.title = 'Con quién es la reunión?';
      this.subtitle = '';
    },
    back() {
      this.$router.push({ path: '/' })
    }
  },
}
</script>

<style lang="scss" scoped>

.header {
  margin-top: 80px;
}

.companies {
  display: flex;
  text-align: center;
  width: 100%;
  
  &__company {
    margin-top: 3em;

    &__logo {
      max-width: 70%;
    }
  }
}

.guest {
  width: 100%;
  margin-top: 2em;

  &__name {
    width: 70%;
    height: 32px;
    line-height: 32px;
    font-size: 28px;
    border: none;
    border-bottom: solid 2px #1f9cce;
    border-radius: 1px;
    padding-bottom: 8px;
    text-align: center;
    font-family: helvetica;
    letter-spacing: 1.5px;
    font-weight: 100;
    margin-bottom: 4px;
  }

  &__confirm {
    width: 30%;
    height: 34px;
    border: none;
    background-color: #22e34d;
    border-radius: 3px;
    color: #fcfcfc;
    font-size: 20px;
    font-weight: bold;
  }
}
</style>



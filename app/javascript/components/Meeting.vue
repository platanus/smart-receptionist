<template>
  <div>
    <div class="header">
      <div class="header__title">{{title}}</div>
      <div class="header__subtitle">{{subtitle}}</div>
    </div>
    <div class="companies" v-show="!askGuestName">
      <button class="header__back" v-on:click="back()"></button>
      <div class="companies__company" v-on:click="showGuest('buda')">
        <img class="companies__company__logo" :src="require('images/buda-logo.png')">
      </div>
      <div class="companies__company" v-on:click="showGuest('fintual')">
        <img class="companies__company__logo" :src="require('images/fintual-logo.png')">
      </div>
      <div class="companies__company" v-on:click="showGuest('platanus')">
        <img class="companies__company__logo" :src="require('images/platanus-logo.png')">
      </div>
    </div>
    <div class="guest" v-show="askGuestName">
      <button class="header__back" v-on:click="hideGuest()"></button>
      <input ref="input" v-model="guestName" class="guest__name" type="text" autofocus>
      <button v-on:click="notifyChannel()" class="guest__confirm">Notificar!</button>
    </div>
  </div>
</template>

<script>
import ApiService from '../services/api.js';
const client = new ApiService;

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
    notifyChannel() {
      const message = `<!here>, llegó ${this.guestName} para que le abran la puerta`;
      client.notifyChannel(this.company, message);
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
  margin-top: 15vh;
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
  margin-top: 20px;

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
    letter-spacing: 1.5px;
    margin-bottom: 4px;
  }

  &__confirm {
    background-color: #1f9cce;
    border: solid 1px #eaeaea;
    border-radius: 3px;
    color: #fcfcfc;
    font-size: 22px;
    font-weight: bold;
    letter-spacing: .6px;
    line-height: 32px;
    margin-top: 15px;
    width: 32%;
  }
}
</style>



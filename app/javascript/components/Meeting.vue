<template>
  <div>
    <div v-if="!timer">
      <div class="header">
        <div class="header__title">{{title}}</div>
      </div>
      <div class="companies" v-show="!askGuestName">
        <button class="header__back" v-on:click="back()"></button>
        <div class="company" v-on:click="showGuest('buda')">
          <img class="company__logo" :src="require('images/buda-logo.png')">
        </div>
        <div class="company" v-on:click="showGuest('fintual')">
          <img class="company__logo" :src="require('images/fintual-logo.png')">
        </div>
        <div class="company" v-on:click="showGuest('platanus')">
          <img class="company__logo" :src="require('images/platanus-logo.png')">
        </div>
        <div class="company" v-on:click="showGuest('general')">
          <img class="company__logo company__logo--small" :src="require('images/unknown-logo.png')">
          <div class="company__name">No sé</div>
        </div>
      </div>
      <div class="guest" v-show="askGuestName">
        <button class="header__back" v-on:click="hideGuest()"></button>
        <input ref="input" v-model="guestName" class="guest__name" type="text" autofocus>
        <button v-on:click="notifyChannel()" class="guest__confirm">Avisar!</button>
      </div>
    </div>
    <timer v-if="timer" :subject="company"></timer>
  </div>
</template>

<script>
import ApiService from '../services/api.js';
const client = new ApiService;

export default {
  name: 'meeting',
  data() {
    return {
      title: '¿A qué empresa vienes?',
      company: '',
      guestName: '',
      askGuestName: false,
      timer: false,
    };
  },
  methods: {
    showGuest(company) {
      this.company = company;
      this.askGuestName = true;
      this.title = '¿Cuál es tu nombre?';
      this.$refs.input.focus();
    },
    notifyChannel() {
      this.timer = true;
      const message = `<!here>, llegó ${this.guestName} para que le abran la puerta`;
      client.notifyChannel(this.company, message);
    },
    hideGuest() {
      this.company = '';
      this.askGuestName = false;
      this.title = '¿A qué empresa vienes?';
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
}

.company {
  display: flex;
  flex-direction: column;
  justify-content: center;
  margin-top: 4em;

  &__name {
    font-size: 26px;
  }

  &__logo {
    align-self: center;
    max-width: 70%;

    &--small {
      max-width: 20%;
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
    border: 0;
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



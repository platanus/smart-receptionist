<template>
  <div>
    <div v-if="!timer">
      <div class="header">
        <div class="header__title">{{title}}</div>
        <div class="header__subtitle">{{subtitle}}</div>
        <button class="header__back" v-on:click="back()"></button>
      </div>
      <div class="companies" v-show="!askGuestName">
        <div class="company company--buda" v-on:click="toggleGuest('buda')" />
        <div class="company company--fintual" v-on:click="toggleGuest('fintual')" />
        <div class="company company--platanus" v-on:click="toggleGuest('platanus')" />
        <div class="company company--unknown" v-on:click="toggleGuest('general')" />
      </div>
      <div class="guest" v-show="askGuestName">
        <button class="header__back" v-on:click="toggleGuest('')"></button>
        <input ref="input" v-model="guestName" class="guest__name" type="text" autofocus placeholder="Escribe aquí">
        <button v-on:click="notifyChannel()" class="guest__confirm">Avisar</button>
      </div>
    </div>
    <timer v-if="timer"></timer>
  </div>
</template>

<script>
import ApiService from '../services/api.js';
const client = new ApiService;

export default {
  name: 'meeting',
  data() {
    return {
      title: '¿En qué empresa?',
      subtitle: 'In which company?',
      company: '',
      guestName: '',
      askGuestName: false,
      timer: false,
    };
  },
  methods: {
    toggleGuest(company) {
      this.company = company;
      this.askGuestName
      this.askGuestName = company ? true : false;
      this.title = company ? '¿Cuál es tu nombre?' : '¿En qué empresa?';
      this.subtitle = company ? "What is your first name?" : 'In which company';
      if (company) this.$refs.input.focus();
    },
    notifyChannel() {
      this.timer = true;
      const message = `<!here>, llegó ${this.guestName} para que le abran la puerta`;
      client.notifyChannel(this.company, message);
    },
    back() {
      this.$router.push({ path: '/' })
    }
  },
}
</script>

<style lang="scss">
@import '../styles/colors';

.companies {
  display: flex;
  text-align: center;
  width: 592px;
  margin: 92px calc(50% - 296px) 0;
  flex-wrap: wrap;
  align-content: space-between;
  justify-content: space-between;
}

.company {
  min-width: 272px;
  height: 116px;
  margin: 28px 0;

  &--buda {
    background-image: url('~images/buda.svg');
  }

  &--fintual {
    background-image: url('~images/fintual.svg');
  }

  &--platanus {
    background-image: url('~images/platanus.svg');
  }

  &--unknown {
    background-image: url('~images/unknown.svg');
  }
}

.guest {
  align-items: center;
  display: flex;
  flex-direction: column;
  margin-top: 128px;
  width: 100%;

  &__name {
    border: 0;
    border-bottom: solid 2px $progressBarColor;
    font-size: 56px;
    font-weight: 300;
    line-height: 66px;
    margin-bottom: 4px;
    padding-bottom: 8px;
    text-align: center;
    width: 75%;
  }

  &__confirm {
    background-color: $progressBarColor;
    border-radius: 12px;
    color: $contrastColor;
    height: 66px;
    font-size: 28px;
    line-height: 66px;
    margin-top: 28px;
    width: 195px;
  }
}
</style>



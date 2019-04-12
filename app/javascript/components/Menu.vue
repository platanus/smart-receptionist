<template>
  <div>
    <div class="header">
      <div class="header__title">Bienvenido a L'Conquistator</div>
      <div class="header__subtitle">Qué se le ofrece?</div>
    </div>
    <div class="menu">
      <div class="action" v-on:click="goToMeeting()">
        <div class="logo__container">
          <img class="action__logo" :src="require('images/buda-logo.png')">
          <img class="action__logo" :src="require('images/fintual-logo.png')">
          <img class="action__logo" :src="require('images/platanus-logo.png')">
        </div>
        <div class="action__title">Vengo a una reunión</div>
      </div>
      <div class="action" v-on:click="goToDelivery()">
          <div class="logo__container">
            <img class="action__logo action__logo--square" :src="require('images/package-logo.png')">
          </div>
        <div class="action__title">Busco a alguien</div>
      </div>
      <div class="action">
          <div class="logo__container">
            <img class="action__logo action__logo--square" :src="require('images/other-logo.png')">
          </div>
        <div class="action__title">Vengo a otra cosa</div>
      </div>
    </div>
  </div>
</template>

<script>

export default {
  name: 'Menu',
  props: {
    msg: String
  },
  data() {
    return {
      meeting: false,
      delivery: false,
      other: false,
    };
  },
  methods: {
    goToMeeting() {
      this.$router.push({ path: 'meeting' })
    },
    goToDelivery() {
      this.$router.push({ path: 'delivery' })
    }
  },
}
</script>

<style lang="scss">
.app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  position: relative;
  overflow: hidden;
}

.header {
  margin-top: 40px;
  margin-bottom: 18px; 

  &__title {
    font-size: 32px;
    font-weight: 500;
  }
  &__subtitle {
    font-size: 24px;
    letter-spacing: 1.5px;
  }
  &__back {
    background-color: transparent;
    background-image: url(../../assets/images/back.png);
    background-repeat: no-repeat;
    background-size: cover;
    border: none;
    height: 42px;
    left: 50px;
    position: absolute;
    top: 50px;
    width: 42px; 
  }
}

.menu {
  display: flex;
  width: 100%;
  text-align: center;
}

.logo__container {
  flex: 6;
  display: flex;
  flex-direction: column;
  justify-content: center;
  text-align: center;
}

.action {
  flex: 1;
  padding: 1em 0em;
  min-height: 150px;
  display: flex;
  flex-direction: column;

  &__logo {
    margin-left: 50%;
    transform: translateX(-50%);
    width: 50%;

    &--square {
      max-width: 160px;
    }
  }

  &__title {
    flex: 1;
    font-size: 18px;
    line-height: 20px;
    font-weight: 300;
  }
}
</style>

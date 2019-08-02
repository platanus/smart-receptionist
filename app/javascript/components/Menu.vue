<template>
  <div>
    <div class="header">
      <div class="header__title">Buen día! A qué vienes hoy?</div>
      <div class="header__subtitle">Hey there! what are you coming to?</div>
    </div>
    <div class="actions">
      <div class="action" v-on:click="goToMeeting()">
        <div class="action__logo action__logo--meeting" />
        <div class="action__title">Reunión</div>
        <div class="action__subtitle">Meeting</div>
      </div>
      <div class="action" v-on:click="goToDelivery()">
        <div class="action__logo action__logo--delivery" />
        <div class="action__title">Busco a alguien</div>
        <div class="action__subtitle">Looking for someone</div>
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

@import '../styles/colors';

body {
  margin: 0;
  overflow: hidden;
}

.app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  text-align: center;
  color: $mainColor;
  position: absolute;
  width: 100%;
  min-height: 100%;
  background-color: #fff;
}

.header {
  margin: 40px 0;

  &__title {
    font-size: 32px;
    font-weight: normal;
    line-height: 38px;
  }

  &__subtitle {
    color: $subtitleColor;
    font-size: 18px;
    line-height: 22px;
    letter-spacing: 1.5px;
    padding: 16px 0 4px;
  }

  &__back {
    background-color: transparent;
    background-image: url('../../assets/images/back.png');
    background-repeat: no-repeat;
    background-size: cover;
    border: 0;
    height: 42px;
    left: 50px;
    position: absolute;
    top: 50px;
    width: 42px;
  }

  &--left {
    text-align: left;
    margin-left: 96px;
  }
}

.actions {
  display: flex;
  padding: 120px;
  justify-content: space-evenly;
}

.action {
  display: flex;
  flex-direction: column;
  align-items: center;

  &__logo {
    height: 120px;
    width: 120px;

    &--meeting {
      background-image: url('~images/meeting.svg');
    }

    &--delivery {
      background-image: url('~images/delivery.svg');
    }
  }

  &__title {
    font-size: 32px;
    line-height: 28px;
  }

  &__subtitle {
    color: $subtitleColor;
    font-size: 20px;
    line-height: 24px;
  }
}
</style>

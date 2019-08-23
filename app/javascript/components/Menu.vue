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
import { setTimeout } from 'timers';

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
  mounted() {
    setTimeout(() => {
      document.getElementsByClassName("progress-bar")[0].style.width = '25%';
    }, 200)
  },
  methods: {
    goToMeeting() {
      this.$router.push({ path: 'meeting' })
      document.getElementsByClassName("progress-bar")[0].style.width = "50%";
    },
    goToDelivery() {
      this.$router.push({ path: 'delivery' })
      document.getElementsByClassName("progress-bar")[0].style.width = "50%";
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

.progress-bar {
  height: 4px;
  background-color: $progressBarColor;
  width: 1%;
  transition: width .8s;
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
    background-image: url('../../assets/images/back.svg');
    background-repeat: no-repeat;
    background-size: cover;
    border: 0;
    height: 32px;
    left: 35px;
    position: absolute;
    top: 45px;
    width: 32px;
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
    background-size: cover;
    height: 240px;
    width: 240px;

    &--meeting {
      background-image: url('../../assets/images/meeting.svg');
    }

    &--delivery {
      background-image: url('../../assets/images/delivery.svg');
    }
  }

  &__title {
    font-size: 32px;
    line-height: 28px;
    padding: 15px 0 0;
  }

  &__subtitle {
    color: $subtitleColor;
    font-size: 20px;
    line-height: 24px;
  }
}
</style>

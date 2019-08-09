<template>
  <div class="notified-modal">
    <div v-if="seconds" class="notified-modal__timer">
      00:{{ seconds > 9 ? seconds : '0'+seconds }}
    </div>
    <div class="notified-modal__title">
      {{ subject ? `Le avisé a ${subject} que llegaste` : "Avisé que llegaste"  }}
    </div>
    <div v-if="!seconds" class="notified-modal__message">Reiniciando asistente...</div>
    <div v-if="seconds" class="notified-modal__message">Ringing the bell</div>
  </div>
</template>

<script>
import { setInterval, clearInterval, setTimeout } from 'timers';

export default {
  name: 'timer',
  props: {
    subject: {
      type: String,
      default: '',
    }
  },
  data() {
    return {
      seconds: 15,
    };
  },
  methods: {
    startTimer() {
      const interval = setInterval(() => {
        this.seconds--;
        if (!this.seconds) {
          clearInterval(interval);
        }
      }, 1000);
    }
  },
  mounted() {
    this.startTimer();
  },
  watch: {
    seconds() {
      if (this.seconds == 0) {
        setTimeout(() => {
          this.$router.push({ path: '/' });
        }, 2000);
      }
    },
  }
}
</script>

<style lang="scss" scoped>
  @import '../styles/colors';

  .notified-modal {
    background-color: $timerBackground;
    color: $contrastColor;
    height: 100%;
    padding-top: 230px;
    position: absolute;
    width: 100%;

    &__title {
      font-size: 48px;
      line-height: 70px;
      padding: 32px 0;
    }

    &__message {
      color: $contrastColorLight;
      font-size: 24px;
      line-height: 28px;
    }

    &__timer {
      font-weight: 600;
      line-height: 85px;
      font-size: 72px;
    }
  }
</style>



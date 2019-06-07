<template>
  <div class="notified-modal">
    <div class="notified-modal__title">
      Le acabo de enviar un mensaje a {{ subject }}
    </div>
    <div class="notified-modal__message">
      Si aun así no te reciben, toca el timbre nuevamente o insiste por aquí.
    </div>
    <div v-if="seconds" class="notified-modal__timer">
      00:{{ seconds > 9 ? seconds : '0'+seconds }}
    </div>
    <div v-if="!seconds" class="notified-modal__message">Redirigiendo...</div>
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
  .notified-modal {
    height: 100%;
    padding-top: 20vh;
    position: absolute;
    width: 100%;

    &__title {
      font-size: 38px;
      line-height: 70px;
    }

    &__message {
      font-size: 18px;
    }

    &__timer {
      margin: 8px 0;
      font-weight: 600;
      font-size: 60px;
    }
  }
</style>



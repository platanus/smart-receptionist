<template>
  <div>
    <div v-if="!modal">
      <div class="header">
        <div class="header__title">¿A quién buscas?</div>
        <div class="header__subtitle">Lo notificaré</div>
        <button class="header__back" v-on:click="back()"></button>
      </div>
      <div class="search">
        <input v-model="query" type="text" class="search__bar" autofocus>
      </div>
      <div class="people">
        <div class="user-card" v-on:click="notifyUser(user)" v-bind:key="user.id" v-for="user in filteredUsers">
          <img class="user-card__avatar" :src="user.image72">
          <div class="user-card__data">
            <div class="user-card__name">{{ user.name }}</div>
            <div class="user-card__email">{{ user.email }}</div>
          </div>
        </div>
      </div>
    </div>
    <div v-if="modal" class="notified-modal">
      <div class="notified-modal__title">
        Le acabo de enviar un mensaje a {{ notifiedUser.name }}
      </div>
      <div class="notified-modal__message">
        Si aun así no viene a abrir, toca el timbre nuevamente o insiste por aquí.
      </div>
      <div v-if="seconds" class="notified-modal__timer">
        00:{{ seconds > 9 ? seconds : '0'+seconds }}
      </div>
      <div v-if="!seconds" class="notified-modal__message">Redirigiendo...</div>
    </div>
  </div>
</template>

<script>
import ApiService from '../services/api.js';
import { setInterval, clearInterval, setTimeout } from 'timers';
const client = new ApiService;

export default {
  name: 'delivery',
  data() {
    return {
      users: {},
      filteredUsers: {},
      query: '',
      notifiedUser: {},
      modal: false,
      seconds: 15,
    };
  },
  methods: {
    back() {
      this.$router.push({ path: '/' });
    },
    notifyUser(user) {
      this.notifiedUser = user;
      this.modal = true;
      this.startTimer();
      client.notifyUser(user.id);
    },
    startTimer() {
      const interval = setInterval(() => {
        this.seconds--
        if (!this.seconds) {
          clearInterval(interval);
        }
      }, 1000);
    }
  },
  async mounted() {
    this.users = await client.getUsers();
    this.filteredUsers = this.users;
  },
  watch: {
    query() {
      this.filteredUsers = this.users.filter((user) => {
        return (user.name + user.email).toLowerCase().indexOf(this.query.toLowerCase()) >= 0;
      });
    },
    seconds() {
      if (this.seconds == 0) {
        setTimeout(() => {
          this.back()
        }, 2000)
      }
    }
  }
};
</script>

<style lang="scss">
.people {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
}

.search {
  width: 100%;
  display: flex;
  text-align: center;
  justify-content: center;
  margin: 40px 0;
  height: 60px;

  &__bar {
    border: none;
    border-bottom: solid 1.5px #3210D3;
    text-align: center;
    width: 80%;
    font-size: 42px;
    color: #3a382b;
  }
}

.user-card {
  border: solid 1px;
  display: flex;
  height: 60px;
  padding: 10px;
  margin: 10px;
  width: 40%;

  &__avatar {
    border-radius: 50%;
    height: 60px;
    width: 60px;
  }

  &__data {
    width: calc(100% - 90px);
    display: flex;
    flex-direction: column;
    justify-content: center;
    font-size: 16px;
    padding: 0 10px;
  }
}

.notified-modal {
  position: fixed;
  height: 100%;
  display: flex;
  width: 100%;
  flex-direction: column;
  justify-content: center;

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



<template>
  <div>
    <div v-if="!timer" class="delivery">
      <div class="column" v-if="!notifiedUser">
        <div class="header header--left">
          <div class="header__title">¿A quién buscas?</div>
          <div class="header__subtitle">Who are you looking for?</div>
          <button class="header__back" v-on:click="back()"></button>
        </div>
        <div class="search">
          <input v-model="query" type="text" class="search__bar" autofocus placeholder="Escribe aquí">
        </div>
      </div>
      <div class="column column--user" v-if="notifiedUser">
        <button class="header__back" v-on:click="selectUser(null)"></button>
        <div class="notified-user">{{ notifiedUser.realName }}</div>
        <button v-on:click="notifyUser()" class="guest__confirm">Avisar</button>
      </div>
      <div class="people">
        <div class="user-card" v-on:click="selectUser(user)" v-bind:key="user.id" v-for="user in filteredUsers">
          <img class="user-card__avatar" :src="user.image72">
          <div class="user-card__data">
            <div class="user-card__name">{{ user.realName }}</div>
          </div>
        </div>
      </div>
    </div>
    <timer v-if="timer" :subject="notifiedUser.realName"></timer>
  </div>
</template>

<script>
import ApiService from '../services/api.js';
const client = new ApiService;

export default {
  name: 'delivery',
  data() {
    return {
      users: {},
      filteredUsers: {},
      query: '',
      notifiedUser: null,
      timer: false,
      seconds: 15,
    };
  },
  methods: {
    back() {
      this.$router.push({ path: '/' });
      document.getElementsByClassName("progress-bar")[0].style.width = '25%';
    },
    selectUser(user) {
      this.notifiedUser = user;
      document.getElementsByClassName("progress-bar")[0].style.width = user ? '75%' : '50%';
    },
    notifyUser() {
      this.timer = true;
      client.notifyUser(this.notifiedUser.id);
    },
  },
  async mounted() {
    this.users = await client.getUsers();
    this.filteredUsers = this.users;
  },
  watch: {
    query() {
      this.filteredUsers = this.users.filter((user) => {
        return (user.realName + user.email).toLowerCase().indexOf(this.query.toLowerCase()) >= 0;
      });
    },
  }
};
</script>

<style lang="scss">

@import '../styles/colors';

.people {
  display: flex;
  flex-wrap: wrap;
  overflow-y: scroll;
  max-height: 100vh;
  width: 416px;
  position: absolute;
  right: 0;
  top: 0;
}

.column {
  width: calc(100% - 416px);

  &--user {
    margin: 120px 80px;
    text-align: left;
  }
}

.search {
  width: 100%;
  margin: 60px 0;
  height: 66px;

  &__bar {
    border: 0;
    border-bottom: solid 1.5px $progressBarColor;
    text-align: left;
    width: 80%;
    font-size: 56px;
    line-height: 66px;
    font-weight: 200;
    padding-bottom: 10px;
  }
}

.user-card {
  border-bottom: solid 1px $subtitleColor;
  display: flex;
  height: 80px;
  padding: 6px;
  width: 100%;

  &__avatar {
    padding: 5px;
    border-radius: 50%;
    height: 70px;
    width: 70px;
  }

  &__data {
    font-size: 18px;
    line-height: 80px;
    padding: 0 16px;
    text-align: left;
    width: calc(100% - 90px);
  }
}

.notified-user {
  line-height: 66px;
  font-size: 56px;
}
</style>

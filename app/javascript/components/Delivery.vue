<template>
  <div>
    <div class="header">
      <div class="header__title">¿A quién buscas?</div>
      <div class="header__subtitle">Lo notificaré</div>
      <button class="header__back" v-on:click="back()"></button>
    </div>
    <div class="search">
      <input v-model="query" type="text" class="search__bar" autofocus>
    </div>
    <div class="people">
      <div class="user-card" v-on:click="notifyUser(user.id)" v-bind:key="user.id" v-for="user in filteredUsers">
        <img class="user-card__avatar" :src="user.image72">
        <div class="user-card__data">
          <div class="user-card__name">{{ user.name }}</div>
          <div class="user-card__email">{{ user.email }}</div>
        </div>
      </div>
    </div>
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
    };
  },
  methods: {
    back() {
      this.$router.push({ path: '/' });
    },
    notifyUser(userId) {
      client.notifyUser(userId);
    },
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
  height: 40px;
  padding: 6px;
  width: 200px;

  &__avatar {
    border-radius: 50%;
    height: 40px;
    width: 40px;
  }
}

</style>



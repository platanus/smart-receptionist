<template>
  <div>
    <div class="header">
      <div class="header__title">¿A quién buscas?</div>
      <div class="header__subtitle">Lo notificaré</div>
      <button class="header__back" v-on:click="back()"></button>
    </div>
    <div class="people">
      <div class="user-card" v-bind:key="user.id" v-for="user in users">
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

export default {
  name: 'delivery',
  data() {
    return {
      users: {},
    };
  },
  methods: {
    back() {
      this.$router.push({ path: '/' });
    },
  },
  async mounted() {
    const client = new ApiService
    this.users = await client.getUsers();
  },
};
</script>

<style lang="scss">
.people {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
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



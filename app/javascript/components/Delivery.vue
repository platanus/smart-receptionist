<template>
  <div>
    <div class="header">
      <div class="header__title">¿A quién buscas?</div>
      <div class="header__subtitle">Lo notificaré</div>
      <button class="header__back" v-on:click="back()"></button>
    </div>
    <select>
      <option>Persona</option>
      <option>Persona</option>
      <option>Persona</option>
    </select>
  </div>
</template>

<script>
export default {
  name: 'delivery',
  methods: {
    back() {
      this.$router.push({ path: '/' });
    },
  },
};
</script>

<style lang="scss">

</style>



<template>
  <div>
    <div class="header header--left">
      <div class="header__title">Ingresa el código</div>
      <button class="header__back" v-on:click="back()"></button>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      code: 4522,
      inputCode: null,
    };
  },
  mounted() {
    document.getElementsByClassName("progress-bar")[0].style.width = '100%';
  },
  methods: {
    back() {
      this.$router.push({ path: '/' })
      document.getElementsByClassName("progress-bar")[0].style.width = "25%";
    }
  }
}
</script>

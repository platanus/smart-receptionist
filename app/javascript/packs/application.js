import Vue from 'vue/dist/vue.js';

import Router from 'vue-router';
import vueTap from 'v-tap';

import Meeting from '../components/Meeting.vue';
import Delivery from '../components/Delivery.vue';
import Menu from '../components/Menu.vue';
import Timer from '../components/Timer.vue';
import MemberAccess from '../components/MemberAccess.vue';

Vue.config.productionTip = false;
Vue.component('timer', Timer);
Vue.use(Router);
Vue.use(vueTap);

const router = new Router({
  routes: [
    { path: '/', component: Menu },
    { path: '/meeting', component: Meeting },
    { path: '/delivery', component: Delivery },
    { path: '/members', component: MemberAccess}
  ],
});

const RESET_TIME = 120000

document.addEventListener('DOMContentLoaded', () => {
  if (document.getElementById('app') !== null) {
    return new Vue({
      router,
      el: '#app',
      render: h => h(Vue.compile('<div class="app"><div class="progress-bar"></div><router-view></router-view></div>')),
      data() {
        return {
          timer: null,
        };
      },
      watch: {
        $route() {
          if (this.timer) clearTimeout(this.timer);
          this.timer = setTimeout(() => {
            this.$router.push({ path: '/' });
          }, RESET_TIME)
        },
      },
    });
  }

  return null;
});

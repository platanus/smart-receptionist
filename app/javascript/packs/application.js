import Vue from 'vue/dist/vue.js';

import Router from 'vue-router';

import Meeting from '../components/Meeting.vue';
import Delivery from '../components/Delivery.vue';
import Menu from '../components/Menu.vue';
import Timer from '../components/Timer.vue';
import MemberAccess from '../components/MemberAccess.vue';

Vue.config.productionTip = false;
Vue.component('timer', Timer);
Vue.use(Router);

const router = new Router({
  routes: [
    { path: '/', component: Menu },
    { path: '/meeting', component: Meeting },
    { path: '/delivery', component: Delivery },
    { path: '/members', component: MemberAccess}
  ],
});

document.addEventListener('DOMContentLoaded', () => {
  if (document.getElementById('app') !== null) {
    return new Vue({
      router,
      el: '#app',
      render: h => h(Vue.compile('<div class="app"><div class="progress-bar"></div><router-view></router-view></div>')),
    });
  }

  return null;
});

import Vue from 'vue/dist/vue.js';

import Router from 'vue-router';

import Meeting from '../components/Meeting.vue';
import Delivery from '../components/Delivery.vue';
import Menu from '../components/Menu.vue';

Vue.config.productionTip = false;
Vue.use(Router);

const router = new Router({
  mode: 'history',
  routes: [
    { path: '/', component: Menu },
    { path: '/meeting', component: Meeting },
    { path: '/delivery', component: Delivery },
  ],
});

document.addEventListener('DOMContentLoaded', () => {
  if (document.getElementById('app') !== null) {
    return new Vue({
      router,
      el: '#app',
      render: h => h(Vue.compile('<div class="app"><router-view></router-view></div>')),
    });
  }

  return null;
});

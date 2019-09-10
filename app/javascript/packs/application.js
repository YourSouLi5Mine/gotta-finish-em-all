import Vue from 'vue/dist/vue.esm'
import VueRouter from 'vue-router'
import routes from '../routes'
import Layout from '../components/Layout'

Vue.use(VueRouter)

const router = new VueRouter({ mode: 'history', routes });

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#app',
    components: {
      Layout
    },
    router
  });
});

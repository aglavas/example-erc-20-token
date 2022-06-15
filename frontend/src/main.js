import Vue from 'vue';
import App from './App.vue';
import Vuex from 'vuex';
import drizzleVuePlugin from '@drizzle/vue-plugin';
import drizzleOptions from './drizzleOptions';
import { createPinia, PiniaVuePlugin } from 'pinia'
import '../node_modules/bootstrap/dist/css/bootstrap.min.css';
import './assets/app.css';

Vue.use(Vuex);

const store = new Vuex.Store({ state: {} });

Vue.use(drizzleVuePlugin, { store, drizzleOptions });
Vue.use(PiniaVuePlugin);
const pinia = createPinia();

new Vue({store, pinia, render: h => h(App)}).$mount('#app');
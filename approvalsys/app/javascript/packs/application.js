/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import './lib/css'
import './lib/script'
import './lib/global'

import Vue from 'vue'
import router from './router'
import App from './App'

import EventBus from './lib/eventBus.js'
import axios from 'axios'
import VueAxiosPlugin from './lib/vue-axios.js'
import Alert from './lib/alert.js'

Vue.prototype.$bus = EventBus
Vue.prototype.$http = axios

Vue.use(Alert)
Vue.use(VueAxiosPlugin, { axios: axios, csrfToken: function(){
    return $('meta[name=csrf-token]').attr('content');
} });

document.addEventListener('DOMContentLoaded', () => {
    const app = new Vue({
        router,
        render: h => h(App)
    }).$mount("#app")
    // document.body.appendChild(app.$el)
})


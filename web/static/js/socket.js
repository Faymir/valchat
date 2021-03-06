// NOTE: The contents of this file will only be executed if
// you uncomment its entry in "web/static/js/app.js".

// To use Phoenix channels, the first step is to import Socket
// and connect at the socket path in "lib/my_app/endpoint.ex":
import {Socket} from "phoenix"

import Vue from 'vue/dist/vue.js'
import MyApp from "../components/my-app.vue"

// ElementUI for design
import ElementUI from 'element-ui'
import locale from 'element-ui/lib/locale/lang/en'


Vue.use(ElementUI, { locale });

import { Button } from 'element-ui';

Vue.prototype.$ELEMENT = { size: 'small', zIndex: 3000 };
Vue.use(Button);


// import Asida from "./../components/asida.vue"
import router from "./router/router.js"
import store from "./store/store.js"



let socket = new Socket("/socket", {params: {token: window.userToken}})
socket.connect()

Vue.config.productionTip = false


// Create the main component
 // Vue.component('my-app', MyApp)


// And create the top-level view model:
new Vue({
  el: '#app',
  router,
  store,
  template: '<MyApp/>',
  components: { MyApp }
  // render(createElement) {
  //   return createElement(MyApp, {})
  // },
  // components: { MyApp , Asida }
  // el: '#app',
  // data() {
  //   return {
  //     channel: null,
  //     messages: []
  //   }
  // },
  // mounted() {
  //     this.channel = socket.channel("room:lobby", {});
  //     this.channel.on("new_msg", payload => {
  //       payload.received_at = Date();
  //       this.messages.push(payload);
  //     });
  //     this.channel.join()
  //       .receive("ok", response => { console.log("Joined successfully", response) })
  //       .receive("error", response => { console.log("Unable to join", response) })
  //   },
  // render(createElement) {
  //   return createElement(MyApp, {})
  // }
});
export default socket

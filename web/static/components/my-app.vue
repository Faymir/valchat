<template>
  <div class="my-app">
    <ul>
      <li>
        <router-link :to="{ name: 'home'}">Home</router-link>
        <router-link :to="{ name: 'foo'}">Foo</router-link>
      </li>
    </ul>
    <router-view></router-view>
  </div>
</template>

<script>

  export default {
    name:"MyApp",
    data() {
      return {
        message: ""
      }
    },
    // components: {
    //   Asida
    // },
    // computed: {
    //   messages() {
    //     return this.$parent.messages
    //   }
    // },
    // methods: {
    //   sendMessage() {
    //     this.$parent.channel.push("new_msg", { body: this.message })
    //     this.message = ''
    //   }
    // }
  }
</script>
<style lang="sass">
  .my-app {
    margin-left: auto;
    margin-right: auto;
    width: 800px;
    h1 {
      text-align: center;
    }
  }
</style>

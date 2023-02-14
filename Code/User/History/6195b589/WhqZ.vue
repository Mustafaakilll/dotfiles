<script setup lang="ts">
return {
  data: {
    msg: "Hello World",
  },
}
</script>

<template>
  <div class="app">
    <img style="size: 100px" alt="Vue logo" src="./assets/logo.svg" />
    <HelloWorld msg="Welcome to Your Vue.js + TypeScript App" />
  </div>
</template>

<style scoped>
.app {
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  size: 100px;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>

<script lang="ts">
export default {
  data() {
    return {
      msg: "Hello World",
      count: 0,
    };
  },

  methods: {
    increment() {
      this.count++;
    },
  },

  mounted() {
    console.log(`The initial count is ${this.count}.`);
  },
};
</script>

<template>
  <div>
    <button @click="increment">Increment</button>
    <p>Count: {{ count }}</p>
  </div>
  <div>
    <p>{{ msg }}</p>
    <input v-model="msg" @click="event=>msg = event.target!.value"/>
    <button :on-click="msg+=!">Add !</button>
  </div>
</template>

<style scoped>
</style>

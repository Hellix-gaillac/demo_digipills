<template>
  <div>
    <h1>Page notice</h1>
    <h3>{{msg}}</h3>
  </div>
</template>

<script>
export default {
  name: "notice",
  data() {
    return {
      msg: "test notice"
    };
  }
};
</script>


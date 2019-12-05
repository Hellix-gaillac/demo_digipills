<template>
  <div id="clock">
    <p class="date">{{ date }}, {{ time }}</p>
  </div>
</template>

<script>
export default {
  data() {
    return {
      time: "",
      date: ""
    };
  },
  methods: {
    updateTime() {
      let week = [
        "Dimanche",
        "Lundi",
        "Mardi",
        "Mercredi",
        "Jeudi",
        "Vendredi",
        "Samedi"
      ];
      let cd = new Date();
      this.time = new Date().toLocaleString("fr-FR", {
        hour: "numeric",
        minute: "2-digit"
        //, second: "numeric"
      });

      this.date = new Date().toLocaleString("fr-FR", {
        weekday: "long",
        day: "numeric",
        month: "long",
        year: "numeric"
      });
    }
  },
  mounted() {
    let timerID = setInterval(this.updateTime, 1000);
    this.updateTime();
  }
};
</script>

<template>
  <div id="app">
    <header-app></header-app>
    <nav-app></nav-app>
    <!-- <fieldset v-show="msgInfo">
      <legend>Message</legend>
      {{msgInfo}}
    </fieldset>
    <fieldset v-if="msgError">
      <legend>Message</legend>
      {{msgError}}
    </fieldset>-->
    <main>
      <router-view />
    </main>
    <footer-app></footer-app>
  </div>
</template>

<script>
//TODO: gerer les message d'erreur
import NavApp from "@/components/NavApp";
import HeaderApp from "@/components/HeaderApp";
import FooterApp from "@/components/FooterApp";
export default {
  name: "App",
  components: {
    HeaderApp,
    NavApp,
    FooterApp
  },
  data() {
    return {
      msgInfo: "Confirmation",
      msgError: "Erreur"
    };
  }
};
</script>

<style src="@/assets/css/app.css"></style>


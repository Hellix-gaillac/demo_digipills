<template>
  <div>
    <header>
      <div class="centerer">
        <div class="title">
          <img
            src="@/assets/img/logo.png"
            alt="Logo de l'application"
            title="DigiPills, Aide à la preise de médicaments"
          />
          <h1>DigiPills</h1>
        </div>
        <div class="user-login" v-if="userConnect">
          <span class="icoLog">
            <a @click="deconnect">
              {{user.prenom}} {{user.nom}}
              <i class="fas fa-sign-out-alt"></i>
            </a>
          </span>
        </div>
        <div class="user-login" v-else>
          <span class="icoLog">
            <router-link to="/connexion" class="link">
              Connexion et inscription
              <i class="fas fa-sign-in-alt"></i>
            </router-link>
          </span>
        </div>
      </div>
    </header>
    <datetime></datetime>
  </div>
</template>

<script>
import Datetime from "@/components/Datetime";
import store from "@/store/Store";
export default {
  store: store,
  data() {
    return {
      user: {}
    };
  },
  components: { Datetime },
  mounted() {
    this.user = JSON.parse(localStorage.getItem("user"));
    if (this.user) {
      store.commit("CONNECT", this.user);
    }
  },
  computed: {
    userConnect() {
      this.user = Object.assign({}, this.$store.getters.doneUserConnected);
      return this.$store.getters.doneConnect;
    }
  },
  methods: {
    deconnect() {
      store.commit("DISCONNECT", this.user);
      if (["accueil"].includes(this.$route.name)) {
        // location.reload();
        this.$router.push({
          name: "accueil"
        });
      } else {
        this.$router.push({
          name: "accueil"
        });
      }
    }
  }
};
</script>
